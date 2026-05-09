; DESCRIPTION: Renders a black box of size 26x114 starting at (81, 47).
; PLAN: r0=81(x), r1=47(y), r2=26(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 47
LDI r2, 26
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
