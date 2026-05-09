; DESCRIPTION: Renders a purple box of size 16x37 starting at (396, 4).
; PLAN: r0=396(x), r1=4(y), r2=16(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 4
LDI r2, 16
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
