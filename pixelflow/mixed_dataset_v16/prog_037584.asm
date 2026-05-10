; DESCRIPTION: Renders a black box of size 110x70 starting at (319, 54).
; PLAN: r0=319(x), r1=54(y), r2=110(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 54
LDI r2, 110
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
