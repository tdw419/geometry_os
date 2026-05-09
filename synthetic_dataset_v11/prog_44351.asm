; DESCRIPTION: Renders a orange box of size 67x85 starting at (162, 171).
; PLAN: r0=162(x), r1=171(y), r2=67(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 171
LDI r2, 67
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
