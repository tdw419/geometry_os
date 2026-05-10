; DESCRIPTION: Renders a black box of size 43x50 starting at (136, 49).
; PLAN: r0=136(x), r1=49(y), r2=43(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 49
LDI r2, 43
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
