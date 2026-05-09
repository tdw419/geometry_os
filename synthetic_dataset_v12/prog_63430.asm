; DESCRIPTION: Renders a black box of size 23x49 starting at (122, 79).
; PLAN: r0=122(x), r1=79(y), r2=23(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 79
LDI r2, 23
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
