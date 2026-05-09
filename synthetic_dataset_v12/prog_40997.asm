; DESCRIPTION: Renders a magenta box of size 97x112 starting at (51, 3).
; PLAN: r0=51(x), r1=3(y), r2=97(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 3
LDI r2, 97
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
