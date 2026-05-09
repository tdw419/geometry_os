; DESCRIPTION: Renders a yellow box of size 19x11 starting at (232, 233).
; PLAN: r0=232(x), r1=233(y), r2=19(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 233
LDI r2, 19
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
