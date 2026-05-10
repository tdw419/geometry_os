; DESCRIPTION: Renders a black box of size 26x107 starting at (407, 1).
; PLAN: r0=407(x), r1=1(y), r2=26(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 1
LDI r2, 26
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
