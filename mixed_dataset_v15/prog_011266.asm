; DESCRIPTION: Renders a green box of size 19x110 starting at (230, 79).
; PLAN: r0=230(x), r1=79(y), r2=19(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 79
LDI r2, 19
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
