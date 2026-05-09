; DESCRIPTION: Renders a black box of size 38x75 starting at (137, 110).
; PLAN: r0=137(x), r1=110(y), r2=38(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 110
LDI r2, 38
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
