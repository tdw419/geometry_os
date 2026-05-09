; DESCRIPTION: Renders a purple box of size 51x119 starting at (69, 75).
; PLAN: r0=69(x), r1=75(y), r2=51(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 75
LDI r2, 51
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
