; DESCRIPTION: Renders a purple box of size 84x119 starting at (107, 90).
; PLAN: r0=107(x), r1=90(y), r2=84(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 90
LDI r2, 84
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
