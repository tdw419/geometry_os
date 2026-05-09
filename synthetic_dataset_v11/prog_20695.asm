; DESCRIPTION: Renders a magenta box of size 88x97 starting at (49, 137).
; PLAN: r0=49(x), r1=137(y), r2=88(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 137
LDI r2, 88
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
