; DESCRIPTION: Renders a black box of size 78x110 starting at (53, 104).
; PLAN: r0=53(x), r1=104(y), r2=78(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 104
LDI r2, 78
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
