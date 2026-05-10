; DESCRIPTION: Renders a black box of size 39x73 starting at (347, 99).
; PLAN: r0=347(x), r1=99(y), r2=39(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 99
LDI r2, 39
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
