; DESCRIPTION: Renders a yellow box of size 25x119 starting at (209, 121).
; PLAN: r0=209(x), r1=121(y), r2=25(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 121
LDI r2, 25
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
