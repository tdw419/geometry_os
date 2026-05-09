; DESCRIPTION: Renders a magenta box of size 77x52 starting at (127, 105).
; PLAN: r0=127(x), r1=105(y), r2=77(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 105
LDI r2, 77
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
