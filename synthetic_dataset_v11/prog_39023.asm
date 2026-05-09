; DESCRIPTION: Renders a yellow box of size 39x110 starting at (90, 121).
; PLAN: r0=90(x), r1=121(y), r2=39(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 121
LDI r2, 39
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
