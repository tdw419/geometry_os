; DESCRIPTION: Renders a black box of size 17x82 starting at (260, 119).
; PLAN: r0=260(x), r1=119(y), r2=17(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 119
LDI r2, 17
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
