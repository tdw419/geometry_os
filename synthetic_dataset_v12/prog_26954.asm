; DESCRIPTION: Renders a magenta box of size 114x15 starting at (313, 18).
; PLAN: r0=313(x), r1=18(y), r2=114(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 18
LDI r2, 114
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
