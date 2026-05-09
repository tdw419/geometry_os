; DESCRIPTION: Renders a black box of size 114x11 starting at (7, 53).
; PLAN: r0=7(x), r1=53(y), r2=114(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 53
LDI r2, 114
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
