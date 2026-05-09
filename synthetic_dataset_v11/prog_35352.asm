; DESCRIPTION: Renders a purple box of size 75x80 starting at (51, 56).
; PLAN: r0=51(x), r1=56(y), r2=75(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 56
LDI r2, 75
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
