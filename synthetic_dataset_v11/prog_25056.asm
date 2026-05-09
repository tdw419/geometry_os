; DESCRIPTION: Renders a yellow box of size 49x36 starting at (202, 110).
; PLAN: r0=202(x), r1=110(y), r2=49(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 110
LDI r2, 49
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
