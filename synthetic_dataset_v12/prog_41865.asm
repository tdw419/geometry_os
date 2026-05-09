; DESCRIPTION: Renders a purple box of size 51x105 starting at (359, 48).
; PLAN: r0=359(x), r1=48(y), r2=51(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 48
LDI r2, 51
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
