; DESCRIPTION: Renders a black box of size 19x71 starting at (0, 123).
; PLAN: r0=0(x), r1=123(y), r2=19(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 123
LDI r2, 19
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
