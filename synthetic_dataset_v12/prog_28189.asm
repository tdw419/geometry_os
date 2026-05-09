; DESCRIPTION: Renders a black box of size 114x62 starting at (84, 153).
; PLAN: r0=84(x), r1=153(y), r2=114(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 153
LDI r2, 114
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
