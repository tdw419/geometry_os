; DESCRIPTION: Renders a orange box of size 67x59 starting at (145, 161).
; PLAN: r0=145(x), r1=161(y), r2=67(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 161
LDI r2, 67
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
