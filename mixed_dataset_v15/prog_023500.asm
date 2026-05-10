; DESCRIPTION: Renders a purple box of size 95x40 starting at (351, 119).
; PLAN: r0=351(x), r1=119(y), r2=95(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 119
LDI r2, 95
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
