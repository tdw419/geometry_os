; DESCRIPTION: Renders a black box of size 96x58 starting at (121, 52).
; PLAN: r0=121(x), r1=52(y), r2=96(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 52
LDI r2, 96
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
