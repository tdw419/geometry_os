; DESCRIPTION: Renders a black box of size 43x17 starting at (6, 238).
; PLAN: r0=6(x), r1=238(y), r2=43(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 238
LDI r2, 43
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
