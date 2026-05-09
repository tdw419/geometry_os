; DESCRIPTION: Renders a magenta box of size 49x97 starting at (151, 2).
; PLAN: r0=151(x), r1=2(y), r2=49(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 2
LDI r2, 49
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
