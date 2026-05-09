; DESCRIPTION: Renders a purple box of size 119x75 starting at (269, 149).
; PLAN: r0=269(x), r1=149(y), r2=119(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 149
LDI r2, 119
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
