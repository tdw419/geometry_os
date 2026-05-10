; DESCRIPTION: Renders a magenta box of size 17x83 starting at (51, 110).
; PLAN: r0=51(x), r1=110(y), r2=17(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 110
LDI r2, 17
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
