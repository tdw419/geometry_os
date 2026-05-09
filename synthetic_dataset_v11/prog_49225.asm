; DESCRIPTION: Renders a black box of size 114x14 starting at (84, 76).
; PLAN: r0=84(x), r1=76(y), r2=114(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 76
LDI r2, 114
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
