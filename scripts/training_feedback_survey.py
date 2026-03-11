#!/usr/bin/env python3
"""
Training Feedback Survey System

Collects and analyzes user feedback on the Native Glyph Shell training program.
Generates reports for continuous improvement.

Usage:
    python3 scripts/training_feedback_survey.py

Options:
    --report     Generate summary report from collected feedback
    --export     Export feedback to CSV format
"""

import sys
import json
import os
from pathlib import Path
from datetime import datetime
from dataclasses import dataclass, asdict
from typing import Optional
from enum import Enum

# ANSI Colors
class Colors:
    RESET = "\033[0m"
    BOLD = "\033[1m"
    DIM = "\033[2m"
    
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
    
    BG_BLUE = "\033[44m"
    BG_GREEN = "\033[42m"
    BG_YELLOW = "\033[43m"


class Rating(Enum):
    VERY_POOR = 1
    POOR = 2
    AVERAGE = 3
    GOOD = 4
    EXCELLENT = 5


@dataclass
class FeedbackResponse:
    """Represents a single feedback response."""
    timestamp: str
    user_id: str  # Anonymous ID
    session_id: str
    
    # Overall ratings (1-5)
    overall_rating: int
    content_quality: int
    exercise_relevance: int
    difficulty_level: int
    pace: int
    
    # Module-specific ratings
    module_ratings: dict[str, int]
    most_helpful_module: str
    needs_improvement_module: str
    
    # Open feedback
    what_worked_well: str
    what_needs_improvement: str
    additional_topics: str
    suggestions: str
    
    # Completion metrics
    time_to_complete_minutes: int
    completed_all_exercises: bool
    would_recommend: bool
    
    # Technical issues
    encountered_issues: bool
    issues_description: str


class FeedbackSurvey:
    """Interactive feedback survey for training program evaluation."""
    
    FEEDBACK_DIR = Path(".geometry/training_feedback")
    FEEDBACK_FILE = FEEDBACK_DIR / "feedback_responses.json"
    
    def __init__(self):
        self.responses: list[FeedbackResponse] = []
        self.current_response: Optional[FeedbackResponse] = None
        self._ensure_feedback_dir()
        self._load_existing_responses()
    
    def _ensure_feedback_dir(self):
        """Ensure feedback directory exists."""
        self.FEEDBACK_DIR.mkdir(parents=True, exist_ok=True)
    
    def _load_existing_responses(self):
        """Load existing feedback responses."""
        if self.FEEDBACK_FILE.exists():
            try:
                with open(self.FEEDBACK_FILE, 'r') as f:
                    data = json.load(f)
                    self.responses = [FeedbackResponse(**r) for r in data]
            except (json.JSONDecodeError, TypeError):
                self.responses = []
    
    def _save_responses(self):
        """Save all feedback responses."""
        with open(self.FEEDBACK_FILE, 'w') as f:
            json.dump([asdict(r) for r in self.responses], f, indent=2)
    
    def _generate_anonymous_id(self) -> str:
        """Generate an anonymous user ID."""
        import hashlib
        import getpass
        user = getpass.getuser()
        return hashlib.sha256(user.encode()).hexdigest()[:8]
    
    def _generate_session_id(self) -> str:
        """Generate a unique session ID."""
        import uuid
        return str(uuid.uuid4())[:8]
    
    def clear_screen(self):
        """Clear the terminal screen."""
        os.system('clear' if os.name == 'posix' else 'cls')
    
    def print_header(self, title: str):
        """Print a styled header."""
        width = 60
        print()
        print(f"{Colors.BG_BLUE}{Colors.WHITE}{'═' * width}{Colors.RESET}")
        print(f"{Colors.BG_BLUE}{Colors.WHITE}  {title.center(width - 2)}  {Colors.RESET}")
        print(f"{Colors.BG_BLUE}{Colors.WHITE}{'═' * width}{Colors.RESET}")
        print()
    
    def print_rating_scale(self):
        """Print the rating scale explanation."""
        print(f"""
{Colors.DIM}Rating Scale:{Colors.RESET}
  1 = Very Poor    2 = Poor    3 = Average    4 = Good    5 = Excellent
""")
    
    def get_rating(self, prompt: str) -> int:
        """Get a rating from 1-5."""
        while True:
            try:
                rating = input(f"{Colors.CYAN}{prompt} (1-5): {Colors.RESET}").strip()
                rating_int = int(rating)
                if 1 <= rating_int <= 5:
                    return rating_int
                print(f"{Colors.RED}Please enter a number between 1 and 5.{Colors.RESET}")
            except ValueError:
                print(f"{Colors.RED}Please enter a valid number.{Colors.RESET}")
    
    def get_text_input(self, prompt: str, optional: bool = False) -> str:
        """Get text input from user."""
        opt_text = " (optional)" if optional else ""
        response = input(f"{Colors.CYAN}{prompt}{opt_text}:{Colors.RESET}\n{Colors.DIM}> {Colors.RESET}").strip()
        return response if response else "N/A" if optional else ""
    
    def get_yes_no(self, prompt: str) -> bool:
        """Get a yes/no response."""
        while True:
            response = input(f"{Colors.CYAN}{prompt} (y/n): {Colors.RESET}").strip().lower()
            if response in ('y', 'yes'):
                return True
            elif response in ('n', 'no'):
                return False
            print(f"{Colors.RED}Please enter 'y' or 'n'.{Colors.RESET}")
    
    def get_selection(self, prompt: str, options: list[str]) -> str:
        """Get a selection from a list of options."""
        print(f"\n{Colors.CYAN}{prompt}{Colors.RESET}")
        for i, option in enumerate(options, 1):
            print(f"  {i}. {option}")
        
        while True:
            try:
                choice = input(f"\n{Colors.CYAN}Select (1-{len(options)}): {Colors.RESET}").strip()
                choice_int = int(choice)
                if 1 <= choice_int <= len(options):
                    return options[choice_int - 1]
                print(f"{Colors.RED}Please enter a number between 1 and {len(options)}.{Colors.RESET}")
            except ValueError:
                print(f"{Colors.RED}Please enter a valid number.{Colors.RESET}")
    
    def run_survey(self):
        """Run the interactive feedback survey."""
        self.clear_screen()
        self.print_header("Training Feedback Survey")
        
        print(f"""
{Colors.BOLD}Thank you for completing the Native Glyph Shell Training Program!{Colors.RESET}

Your feedback is valuable for improving this training program.
This survey takes approximately 5 minutes to complete.

{Colors.DIM}All responses are anonymous and will be used to improve the training.{Colors.RESET}
""")
        
        input(f"{Colors.DIM}Press Enter to begin...{Colors.RESET}")
        
        # Initialize response
        self.current_response = FeedbackResponse(
            timestamp=datetime.now().isoformat(),
            user_id=self._generate_anonymous_id(),
            session_id=self._generate_session_id(),
            overall_rating=0,
            content_quality=0,
            exercise_relevance=0,
            difficulty_level=0,
            pace=0,
            module_ratings={},
            most_helpful_module="",
            needs_improvement_module="",
            what_worked_well="",
            what_needs_improvement="",
            additional_topics="",
            suggestions="",
            time_to_complete_minutes=0,
            completed_all_exercises=False,
            would_recommend=False,
            encountered_issues=False,
            issues_description=""
        )
        
        # Section 1: Overall Ratings
        self.clear_screen()
        self.print_header("Section 1: Overall Ratings")
        self.print_rating_scale()
        
        self.current_response.overall_rating = self.get_rating(
            "How would you rate the overall training program?"
        )
        self.current_response.content_quality = self.get_rating(
            "How would you rate the quality of the training content?"
        )
        self.current_response.exercise_relevance = self.get_rating(
            "How relevant were the exercises to real-world use?"
        )
        self.current_response.difficulty_level = self.get_rating(
            "How appropriate was the difficulty level?"
        )
        self.current_response.pace = self.get_rating(
            "How was the pace of the training?"
        )
        
        # Section 2: Module Ratings
        self.clear_screen()
        self.print_header("Section 2: Module Feedback")
        
        modules = [
            "Module 1: Getting Started",
            "Module 2: Keyboard Navigation",
            "Module 3: Geometry OS Commands",
            "Module 4: AI Context Injection",
            "Module 5: GNB State Synchronization",
            "Module 6: Advanced Features",
            "Module 7: Troubleshooting"
        ]
        
        print(f"{Colors.DIM}Rate each module (1-5, or 0 if not completed):{Colors.RESET}\n")
        for module in modules:
            rating = self.get_rating(module.replace("Module X: ", ""))
            if rating > 0:
                self.current_response.module_ratings[module] = rating
        
        self.current_response.most_helpful_module = self.get_selection(
            "Which module was most helpful?", modules
        )
        self.current_response.needs_improvement_module = self.get_selection(
            "Which module needs the most improvement?", modules
        )
        
        # Section 3: Open Feedback
        self.clear_screen()
        self.print_header("Section 3: Open Feedback")
        
        self.current_response.what_worked_well = self.get_text_input(
            "What worked well in the training?"
        )
        self.current_response.what_needs_improvement = self.get_text_input(
            "What could be improved?"
        )
        self.current_response.additional_topics = self.get_text_input(
            "What additional topics should be covered?", optional=True
        )
        self.current_response.suggestions = self.get_text_input(
            "Any other suggestions or comments?", optional=True
        )
        
        # Section 4: Completion Metrics
        self.clear_screen()
        self.print_header("Section 4: Completion Metrics")
        
        while True:
            try:
                time_str = input(f"{Colors.CYAN}How many minutes did it take to complete? {Colors.RESET}").strip()
                self.current_response.time_to_complete_minutes = int(time_str)
                break
            except ValueError:
                print(f"{Colors.RED}Please enter a valid number.{Colors.RESET}")
        
        self.current_response.completed_all_exercises = self.get_yes_no(
            "Did you complete all exercises?"
        )
        self.current_response.would_recommend = self.get_yes_no(
            "Would you recommend this training to others?"
        )
        
        # Section 5: Technical Issues
        self.clear_screen()
        self.print_header("Section 5: Technical Issues")
        
        self.current_response.encountered_issues = self.get_yes_no(
            "Did you encounter any technical issues during the training?"
        )
        
        if self.current_response.encountered_issues:
            self.current_response.issues_description = self.get_text_input(
                "Please describe the issues you encountered"
            )
        
        # Save response
        self.responses.append(self.current_response)
        self._save_responses()
        
        # Show thank you
        self.clear_screen()
        self.print_header("Thank You!")
        
        print(f"""
{Colors.GREEN}Your feedback has been recorded!{Colors.RESET}

{Colors.BOLD}Summary of your ratings:{Colors.RESET}
  Overall Rating: {'⭐' * self.current_response.overall_rating}
  Content Quality: {'⭐' * self.current_response.content_quality}
  Exercise Relevance: {'⭐' * self.current_response.exercise_relevance}
  
{Colors.DIM}Your feedback helps us improve the training program for future users.{Colors.RESET}

{Colors.CYAN}Session ID: {self.current_response.session_id}{Colors.RESET}
""")
    
    def generate_report(self) -> str:
        """Generate a summary report from collected feedback."""
        if not self.responses:
            return "No feedback responses collected yet."
        
        report = []
        report.append("=" * 60)
        report.append("TRAINING FEEDBACK SUMMARY REPORT")
        report.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        report.append(f"Total Responses: {len(self.responses)}")
        report.append("=" * 60)
        report.append("")
        
        # Overall statistics
        avg_overall = sum(r.overall_rating for r in self.responses) / len(self.responses)
        avg_content = sum(r.content_quality for r in self.responses) / len(self.responses)
        avg_exercises = sum(r.exercise_relevance for r in self.responses) / len(self.responses)
        avg_difficulty = sum(r.difficulty_level for r in self.responses) / len(self.responses)
        avg_pace = sum(r.pace for r in self.responses) / len(self.responses)
        
        report.append("OVERALL RATINGS (Average)")
        report.append("-" * 40)
        report.append(f"  Overall Rating:       {avg_overall:.1f}/5.0 {'⭐' * round(avg_overall)}")
        report.append(f"  Content Quality:      {avg_content:.1f}/5.0 {'⭐' * round(avg_content)}")
        report.append(f"  Exercise Relevance:   {avg_exercises:.1f}/5.0 {'⭐' * round(avg_exercises)}")
        report.append(f"  Difficulty Level:     {avg_difficulty:.1f}/5.0")
        report.append(f"  Pace:                 {avg_pace:.1f}/5.0")
        report.append("")
        
        # Recommendation rate
        recommend_count = sum(1 for r in self.responses if r.would_recommend)
        recommend_pct = (recommend_count / len(self.responses)) * 100
        report.append(f"RECOMMENDATION RATE: {recommend_pct:.1f}% ({recommend_count}/{len(self.responses)})")
        report.append("")
        
        # Completion rate
        completed_count = sum(1 for r in self.responses if r.completed_all_exercises)
        completed_pct = (completed_count / len(self.responses)) * 100
        report.append(f"COMPLETION RATE: {completed_pct:.1f}% ({completed_count}/{len(self.responses)})")
        report.append("")
        
        # Average time
        avg_time = sum(r.time_to_complete_minutes for r in self.responses) / len(self.responses)
        report.append(f"AVERAGE COMPLETION TIME: {avg_time:.0f} minutes")
        report.append("")
        
        # Most helpful module
        module_counts: dict[str, int] = {}
        for r in self.responses:
            module_counts[r.most_helpful_module] = module_counts.get(r.most_helpful_module, 0) + 1
        
        if module_counts:
            most_helpful = max(module_counts.items(), key=lambda x: x[1])
            report.append(f"MOST HELPFUL MODULE: {most_helpful[0]} ({most_helpful[1]} votes)")
        
        # Module needing improvement
        improvement_counts: dict[str, int] = {}
        for r in self.responses:
            improvement_counts[r.needs_improvement_module] = improvement_counts.get(r.needs_improvement_module, 0) + 1
        
        if improvement_counts:
            needs_improvement = max(improvement_counts.items(), key=lambda x: x[1])
            report.append(f"NEEDS IMPROVEMENT: {needs_improvement[0]} ({needs_improvement[1]} votes)")
        
        report.append("")
        
        # Technical issues
        issues_count = sum(1 for r in self.responses if r.encountered_issues)
        issues_pct = (issues_count / len(self.responses)) * 100
        report.append(f"TECHNICAL ISSUES: {issues_pct:.1f}% encountered issues")
        report.append("")
        
        # Recent feedback quotes
        report.append("RECENT FEEDBACK QUOTES")
        report.append("-" * 40)
        for r in self.responses[-5:]:
            if r.what_worked_well and r.what_worked_well != "N/A":
                report.append(f"  What worked: \"{r.what_worked_well[:100]}...\"")
            if r.suggestions and r.suggestions != "N/A":
                report.append(f"  Suggestion: \"{r.suggestions[:100]}...\"")
        
        report.append("")
        report.append("=" * 60)
        report.append("END OF REPORT")
        report.append("=" * 60)
        
        return "\n".join(report)
    
    def export_csv(self, output_path: Optional[str] = None):
        """Export feedback to CSV format."""
        import csv
        
        if not self.responses:
            print("No feedback responses to export.")
            return
        
        if output_path is None:
            output_path = str(self.FEEDBACK_DIR / "feedback_export.csv")
        
        fieldnames = [
            'timestamp', 'user_id', 'session_id', 'overall_rating',
            'content_quality', 'exercise_relevance', 'difficulty_level', 'pace',
            'module_ratings', 'most_helpful_module', 'needs_improvement_module',
            'what_worked_well', 'what_needs_improvement', 'additional_topics',
            'suggestions', 'time_to_complete_minutes', 'completed_all_exercises',
            'would_recommend', 'encountered_issues', 'issues_description'
        ]
        
        with open(output_path, 'w', newline='') as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            for response in self.responses:
                # Convert module_ratings dict to string for CSV
                row = asdict(response)
                row['module_ratings'] = json.dumps(row.get('module_ratings', {}))
                writer.writerow(row)
        
        print(f"Exported {len(self.responses)} responses to: {output_path}")


def main():
    """Main entry point."""
    import argparse
    
    parser = argparse.ArgumentParser(
        description="Training Feedback Survey System"
    )
    parser.add_argument(
        "--report", "-r",
        action="store_true",
        help="Generate summary report"
    )
    parser.add_argument(
        "--export", "-e",
        action="store_true",
        help="Export feedback to CSV"
    )
    parser.add_argument(
        "--output", "-o",
        type=str,
        help="Output file path for CSV export"
    )
    
    args = parser.parse_args()
    
    survey = FeedbackSurvey()
    
    if args.report:
        print(survey.generate_report())
    elif args.export:
        survey.export_csv(args.output)
    else:
        # Run interactive survey
        survey.run_survey()


if __name__ == "__main__":
    main()
