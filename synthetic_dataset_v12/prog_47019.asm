; DESCRIPTION: Renders a green box of size 35x110 starting at (469, 21).
; PLAN: r0=469(x), r1=21(y), r2=35(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 21
LDI r2, 35
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
