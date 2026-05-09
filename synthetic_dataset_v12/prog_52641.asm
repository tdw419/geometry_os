; DESCRIPTION: Renders a black box of size 101x114 starting at (285, 97).
; PLAN: r0=285(x), r1=97(y), r2=101(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 97
LDI r2, 101
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
