; DESCRIPTION: Renders a black box of size 46x101 starting at (119, 114).
; PLAN: r0=119(x), r1=114(y), r2=46(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 114
LDI r2, 46
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
