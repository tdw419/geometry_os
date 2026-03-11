#!/usr/bin/env python3
"""
Training Certificate Generator

Generates a completion certificate for users who have completed
the Native Glyph Shell Training Program.

Usage:
    python3 scripts/generate_training_certificate.py --user "John Doe" --completed

Options:
    --user       User name for certificate
    --completed  Mark as completed
    --output     Output directory (default: ~/.gshell/certificates)
"""

import sys
import os
from pathlib import Path
from datetime import datetime
from typing import Optional
import hashlib

# ANSI Colors
class Colors:
    RESET = "\033[0m"
    BOLD = "\033[1m"
    DIM = "\033[2m"
    ITALIC = "\033[3m"
    
    RED = "\033[31m"
    GREEN = "\033[32m"
    YELLOW = "\033[33m"
    BLUE = "\033[34m"
    MAGENTA = "\033[35m"
    CYAN = "\033[36m"
    WHITE = "\033[37m"
    
    BRIGHT_GREEN = "\033[92m"
    BRIGHT_YELLOW = "\033[93m"
    BRIGHT_BLUE = "\033[94m"
    BRIGHT_CYAN = "\033[96m"


class CertificateGenerator:
    """Generates training completion certificates."""
    
    CERTIFICATE_DIR = Path.home() / ".gshell" / "certificates"
    
    def __init__(self, user_name: str, output_dir: Optional[str] = None):
        self.user_name = user_name
        self.completion_date = datetime.now()
        self.certificate_id = self._generate_certificate_id()
        
        if output_dir:
            self.output_dir = Path(output_dir)
        else:
            self.output_dir = self.CERTIFICATE_DIR
        
        self.output_dir.mkdir(parents=True, exist_ok=True)
    
    def _generate_certificate_id(self) -> str:
        """Generate a unique certificate ID."""
        data = f"{self.user_name}{self.completion_date.isoformat()}"
        return hashlib.sha256(data.encode()).hexdigest()[:12].upper()
    
    def generate_text_certificate(self) -> str:
        """Generate a text-based certificate."""
        border = "═" * 60
        line = "─" * 60
        
        cert = f"""
{border}
║{'':^58}║
║{'CERTIFICATE OF COMPLETION':^58}║
║{'':^58}║
{border}
║{'':^58}║
║{'This is to certify that':^58}║
║{'':^58}║
║{self.user_name:^58}║
║{'':^58}║
║{'has successfully completed the':^58}║
║{'':^58}║
║{'NATIVE GLYPH SHELL TRAINING PROGRAM':^58}║
║{'':^58}║
║{'Geometry OS':^58}║
║{'':^58}║
{line}
║{'':^58}║
║  Certificate ID: {self.certificate_id:<39}║
║  Completion Date: {self.completion_date.strftime('%Y-%m-%d'):<37}║
║{'':^58}║
{border}
"""
        return cert
    
    def generate_markdown_certificate(self) -> str:
        """Generate a markdown certificate."""
        cert = f"""# 🎓 Certificate of Completion

---

## Native Glyph Shell Training Program

This is to certify that

### **{self.user_name}**

has successfully completed the

**Native Glyph Shell Training Program**

for Geometry OS

---

| Field | Value |
|-------|-------|
| Certificate ID | `{self.certificate_id}` |
| Completion Date | {self.completion_date.strftime('%Y-%m-%d')} |
| Program Version | 1.0 |

---

### Skills Acquired

- [x] G-Shell Navigation
- [x] Keyboard Shortcuts
- [x] Geometry OS Commands
- [x] AI Context Injection
- [x] GNB State Synchronization
- [x] Advanced Features
- [x] Troubleshooting

---

*This certificate verifies completion of the Native Glyph Shell Training Program.*

*Geometry OS - GPU-native, self-hosting operating system with visual computation*
"""
        return cert
    
    def generate_html_certificate(self) -> str:
        """Generate an HTML certificate."""
        html = f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Training Certificate - {self.user_name}</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Roboto:wght@300;400&display=swap');
        
        * {{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }}
        
        body {{
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }}
        
        .certificate {{
            background: linear-gradient(145deg, #ffffff 0%, #f5f5f5 100%);
            border-radius: 10px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            max-width: 800px;
            width: 100%;
            padding: 60px;
            text-align: center;
            border: 3px solid #2c3e50;
            position: relative;
            overflow: hidden;
        }}
        
        .certificate::before {{
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 10px;
            background: linear-gradient(90deg, #3498db, #9b59b6, #3498db);
        }}
        
        .certificate::after {{
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 10px;
            background: linear-gradient(90deg, #3498db, #9b59b6, #3498db);
        }}
        
        .logo {{
            font-size: 48px;
            margin-bottom: 20px;
        }}
        
        h1 {{
            font-family: 'Playfair Display', serif;
            font-size: 36px;
            color: #2c3e50;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 3px;
        }}
        
        .subtitle {{
            font-size: 14px;
            color: #7f8c8d;
            margin-bottom: 40px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }}
        
        .certifies {{
            font-size: 16px;
            color: #7f8c8d;
            margin-bottom: 10px;
        }}
        
        .recipient {{
            font-family: 'Playfair Display', serif;
            font-size: 32px;
            color: #2c3e50;
            margin-bottom: 30px;
            border-bottom: 2px solid #3498db;
            display: inline-block;
            padding-bottom: 10px;
        }}
        
        .program-name {{
            font-size: 18px;
            font-weight: bold;
            color: #3498db;
            margin-bottom: 10px;
        }}
        
        .organization {{
            font-size: 14px;
            color: #7f8c8d;
            margin-bottom: 40px;
        }}
        
        .details {{
            display: flex;
            justify-content: center;
            gap: 60px;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }}
        
        .detail-item {{
            text-align: center;
        }}
        
        .detail-label {{
            font-size: 12px;
            color: #7f8c8d;
            text-transform: uppercase;
            letter-spacing: 1px;
        }}
        
        .detail-value {{
            font-size: 14px;
            color: #2c3e50;
            font-weight: bold;
            margin-top: 5px;
        }}
        
        .badge {{
            display: inline-block;
            background: linear-gradient(135deg, #3498db, #9b59b6);
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 30px;
        }}
        
        .skills {{
            margin-top: 40px;
            text-align: left;
        }}
        
        .skills h3 {{
            font-size: 14px;
            color: #7f8c8d;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 15px;
            text-align: center;
        }}
        
        .skills-list {{
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
        }}
        
        .skill {{
            background: #f8f9fa;
            color: #2c3e50;
            padding: 5px 15px;
            border-radius: 15px;
            font-size: 12px;
            border: 1px solid #e9ecef;
        }}
        
        @media print {{
            body {{
                background: white;
                padding: 0;
            }}
            .certificate {{
                box-shadow: none;
                border: 2px solid #2c3e50;
            }}
        }}
    </style>
</head>
<body>
    <div class="certificate">
        <div class="logo">🎓</div>
        <h1>Certificate of Completion</h1>
        <div class="subtitle">Geometry OS Training Program</div>
        
        <p class="certifies">This is to certify that</p>
        <div class="recipient">{self.user_name}</div>
        
        <p class="certifies">has successfully completed the</p>
        <div class="program-name">Native Glyph Shell Training Program</div>
        <div class="organization">Geometry OS - GPU-native Operating System</div>
        
        <div class="badge">Certified G-Shell User</div>
        
        <div class="skills">
            <h3>Skills Acquired</h3>
            <div class="skills-list">
                <span class="skill">✓ G-Shell Navigation</span>
                <span class="skill">✓ Keyboard Shortcuts</span>
                <span class="skill">✓ Geometry OS Commands</span>
                <span class="skill">✓ AI Context Injection</span>
                <span class="skill">✓ GNB Synchronization</span>
                <span class="skill">✓ Advanced Features</span>
                <span class="skill">✓ Troubleshooting</span>
            </div>
        </div>
        
        <div class="details">
            <div class="detail-item">
                <div class="detail-label">Certificate ID</div>
                <div class="detail-value">{self.certificate_id}</div>
            </div>
            <div class="detail-item">
                <div class="detail-label">Completion Date</div>
                <div class="detail-value">{self.completion_date.strftime('%B %d, %Y')}</div>
            </div>
            <div class="detail-item">
                <div class="detail-label">Program Version</div>
                <div class="detail-value">1.0</div>
            </div>
        </div>
    </div>
</body>
</html>
"""
        return html
    
    def save_certificates(self) -> dict[str, Path]:
        """Save all certificate formats."""
        paths = {}
        
        # Save text certificate
        text_path = self.output_dir / f"certificate_{self.certificate_id}.txt"
        text_path.write_text(self.generate_text_certificate())
        paths['text'] = text_path
        
        # Save markdown certificate
        md_path = self.output_dir / f"certificate_{self.certificate_id}.md"
        md_path.write_text(self.generate_markdown_certificate())
        paths['markdown'] = md_path
        
        # Save HTML certificate
        html_path = self.output_dir / f"certificate_{self.certificate_id}.html"
        html_path.write_text(self.generate_html_certificate())
        paths['html'] = html_path
        
        return paths
    
    def display_certificate(self):
        """Display the text certificate in terminal."""
        print(self.generate_text_certificate())
    
    def print_summary(self, paths: dict[str, Path]):
        """Print a summary of saved certificates."""
        print(f"\n{Colors.BRIGHT_GREEN}✓ Certificates generated successfully!{Colors.RESET}\n")
        print(f"{Colors.CYAN}Certificate ID:{Colors.RESET} {self.certificate_id}")
        print(f"{Colors.CYAN}Recipient:{Colors.RESET} {self.user_name}")
        print(f"{Colors.CYMAN}Date:{Colors.RESET} {self.completion_date.strftime('%Y-%m-%d')}\n")
        print(f"{Colors.BOLD}Saved to:{Colors.RESET}")
        for format_type, path in paths.items():
            print(f"  {Colors.DIM}{format_type.upper():10}{Colors.RESET} {path}")
        print(f"\n{Colors.DIM}Open the HTML file in a browser for a printable certificate.{Colors.RESET}")


def main():
    """Main entry point."""
    import argparse
    import getpass
    
    parser = argparse.ArgumentParser(
        description="Generate Training Completion Certificate"
    )
    parser.add_argument(
        "--user", "-u",
        type=str,
        help="User name for certificate (default: current user)"
    )
    parser.add_argument(
        "--completed", "-c",
        action="store_true",
        help="Mark as completed"
    )
    parser.add_argument(
        "--output", "-o",
        type=str,
        help="Output directory"
    )
    parser.add_argument(
        "--display", "-d",
        action="store_true",
        help="Display certificate in terminal"
    )
    parser.add_argument(
        "--format", "-f",
        choices=['text', 'markdown', 'html', 'all'],
        default='all',
        help="Certificate format (default: all)"
    )
    
    args = parser.parse_args()
    
    # Get user name
    user_name = args.user or getpass.getuser()
    
    if not args.completed:
        print(f"{Colors.YELLOW}Warning: Certificate generated without --completed flag.{Colors.RESET}")
        print(f"{Colors.DIM}Use --completed to mark as officially completed.{Colors.RESET}\n")
    
    # Generate certificate
    generator = CertificateGenerator(user_name, args.output)
    
    if args.display or args.format == 'text':
        generator.display_certificate()
    
    if args.format in ('all', 'markdown', 'html') or not args.display:
        paths = generator.save_certificates()
        generator.print_summary(paths)


if __name__ == "__main__":
    main()
