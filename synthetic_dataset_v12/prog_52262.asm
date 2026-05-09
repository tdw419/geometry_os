; DESCRIPTION: Renders a black box of size 19x104 starting at (86, 121).
; PLAN: r0=86(x), r1=121(y), r2=19(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 121
LDI r2, 19
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
