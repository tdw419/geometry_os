; DESCRIPTION: Renders a black box of size 43x31 starting at (126, 58).
; PLAN: r0=126(x), r1=58(y), r2=43(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 58
LDI r2, 43
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
