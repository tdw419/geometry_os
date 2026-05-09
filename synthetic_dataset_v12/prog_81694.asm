; DESCRIPTION: Renders a magenta box of size 18x114 starting at (15, 135).
; PLAN: r0=15(x), r1=135(y), r2=18(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 135
LDI r2, 18
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
