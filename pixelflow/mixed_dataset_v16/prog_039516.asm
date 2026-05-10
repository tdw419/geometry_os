; DESCRIPTION: Renders a purple box of size 25x82 starting at (250, 119).
; PLAN: r0=250(x), r1=119(y), r2=25(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 119
LDI r2, 25
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
