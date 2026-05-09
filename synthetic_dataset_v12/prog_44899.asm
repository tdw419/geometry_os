; DESCRIPTION: Renders a purple box of size 48x51 starting at (388, 176).
; PLAN: r0=388(x), r1=176(y), r2=48(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 176
LDI r2, 48
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
