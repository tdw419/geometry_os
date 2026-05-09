; DESCRIPTION: Renders a purple box of size 11x80 starting at (153, 90).
; PLAN: r0=153(x), r1=90(y), r2=11(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 90
LDI r2, 11
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
