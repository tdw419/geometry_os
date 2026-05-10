; DESCRIPTION: Renders a purple box of size 65x81 starting at (274, 65).
; PLAN: r0=274(x), r1=65(y), r2=65(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 65
LDI r2, 65
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
