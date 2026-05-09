; DESCRIPTION: Renders a purple box of size 74x35 starting at (323, 51).
; PLAN: r0=323(x), r1=51(y), r2=74(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 51
LDI r2, 74
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
