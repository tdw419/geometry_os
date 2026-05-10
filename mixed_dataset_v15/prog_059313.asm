; DESCRIPTION: Renders a orange box of size 87x71 starting at (313, 162).
; PLAN: r0=313(x), r1=162(y), r2=87(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 162
LDI r2, 87
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
