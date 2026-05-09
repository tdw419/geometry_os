; DESCRIPTION: Renders a black box of size 19x17 starting at (137, 224).
; PLAN: r0=137(x), r1=224(y), r2=19(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 224
LDI r2, 19
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
