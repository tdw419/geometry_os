; DESCRIPTION: Renders a black box of size 43x24 starting at (137, 124).
; PLAN: r0=137(x), r1=124(y), r2=43(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 124
LDI r2, 43
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
