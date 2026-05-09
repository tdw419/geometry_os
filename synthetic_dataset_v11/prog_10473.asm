; DESCRIPTION: Renders a black box of size 31x108 starting at (2, 43).
; PLAN: r0=2(x), r1=43(y), r2=31(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 43
LDI r2, 31
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
