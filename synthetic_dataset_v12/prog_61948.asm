; DESCRIPTION: Renders a black box of size 114x53 starting at (181, 87).
; PLAN: r0=181(x), r1=87(y), r2=114(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 87
LDI r2, 114
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
