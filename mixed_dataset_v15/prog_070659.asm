; DESCRIPTION: Renders a black box of size 118x110 starting at (17, 96).
; PLAN: r0=17(x), r1=96(y), r2=118(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 96
LDI r2, 118
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
