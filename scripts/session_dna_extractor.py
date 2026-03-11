import json
import os
import glob
import sys
import subprocess

def check_git_status(filepath):
    """Check if a file has uncommitted changes or when it was last committed."""
    try:
        # Check uncommitted changes
        status_output = subprocess.check_output(
            ["git", "status", "--porcelain", filepath], 
            stderr=subprocess.DEVNULL, text=True
        ).strip()
        
        if status_output:
            return "Uncommitted changes"
            
        # Check last commit time
        log_output = subprocess.check_output(
            ["git", "log", "-1", "--format=%cd", "--date=relative", filepath],
            stderr=subprocess.DEVNULL, text=True
        ).strip()
        
        if log_output:
            return f"Committed {log_output}"
            
        return "Not tracked or no history"
    except subprocess.CalledProcessError:
        return "Git error or file missing"

def extract_session_dna(session_dir, limit=5):
    # Find latest jsonl session files
    session_files = sorted(glob.glob(os.path.join(session_dir, "*.jsonl")), reverse=True)[:limit]
    
    dna_report = []
    
    for session_file in session_files:
        session_id = os.path.basename(session_file).split('_')[0]
        
        with open(session_file, 'r') as f:
            lines = f.readlines()
            
        session_intent = ""
        failures = []
        files_touched = set()
        
        for line in lines:
            try:
                data = json.loads(line)
                
                # Check messages
                if data.get("type") == "message":
                    msg = data["message"]
                    role = msg.get("role")
                    content = msg.get("content", [])
                    
                    for item in content:
                        if item.get("type") == "text":
                            text = item["text"]
                            # Capture first user message as intent
                            if role == "user" and not session_intent:
                                session_intent = text[:300].replace('\n', ' ')
                        
                        # Look for tool calls to track files modified
                        elif item.get("type") == "toolCall":
                            name = item.get("name")
                            if name in ["write", "edit"]:
                                filepath = item.get("arguments", {}).get("path", "")
                                if filepath:
                                    files_touched.add(filepath)
                                    
                        # Track errors from tools
                        elif item.get("type") == "toolResult" and data.get("isError"):
                            err_text = item.get("text", "")[:200].replace('\n', ' ')
                            if err_text not in failures:
                                failures.append(err_text)
                                
                # Alternative format checking (sometimes tool calls are nested differently)
                if "message" in data and "content" in data["message"]:
                    for item in data["message"]["content"]:
                        if item.get("type") == "toolCall" and item.get("name") in ["write", "edit"]:
                            filepath = item["arguments"].get("path", "")
                            if filepath:
                                files_touched.add(filepath)
            except json.JSONDecodeError:
                continue

        # Check git status for files touched
        file_statuses = {}
        for f in files_touched:
            file_statuses[f] = check_git_status(f)
            
        if session_intent or failures or file_statuses:
            dna_report.append({
                "session": session_id,
                "intent": session_intent if session_intent else "Unknown intent",
                "failures": failures,
                "files": file_statuses
            })

    # Generate Markdown Report
    report_md = "## Recent Session DNA\n\n"
    if not dna_report:
        report_md += "No recent actionable history found.\n"
        return report_md
        
    for dna in dna_report:
        report_md += f"### Session {dna['session']}\n"
        report_md += f"**Intent:** {dna['intent']}...\n\n"
        
        if dna['failures']:
            report_md += "**Failures Encountered:**\n"
            for fail in dna['failures']:
                report_md += f"- `{fail}`\n"
            report_md += "\n"
            
        if dna['files']:
            report_md += "**Files Touched & Git Status:**\n"
            for filepath, status in dna['files'].items():
                report_md += f"- `{filepath}`: {status}\n"
            report_md += "\n"
            
    return report_md

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python session_dna_extractor.py <session_dir>")
        sys.exit(1)
        
    session_dir = sys.argv[1]
    print(extract_session_dna(session_dir))
