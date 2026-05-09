; DESCRIPTION: Renders a black box of size 114x63 starting at (89, 170).
; PLAN: r0=89(x), r1=170(y), r2=114(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 170
LDI r2, 114
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
