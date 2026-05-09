; DESCRIPTION: Renders a black box of size 43x37 starting at (67, 123).
; PLAN: r0=67(x), r1=123(y), r2=43(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 123
LDI r2, 43
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
