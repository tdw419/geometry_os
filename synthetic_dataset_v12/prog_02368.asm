; DESCRIPTION: Renders a purple box of size 26x37 starting at (240, 119).
; PLAN: r0=240(x), r1=119(y), r2=26(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 119
LDI r2, 26
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
