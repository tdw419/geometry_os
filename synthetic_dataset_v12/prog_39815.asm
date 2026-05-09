; DESCRIPTION: Renders a black box of size 88x62 starting at (330, 104).
; PLAN: r0=330(x), r1=104(y), r2=88(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 104
LDI r2, 88
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
