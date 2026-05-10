; DESCRIPTION: Renders a yellow box of size 110x73 starting at (8, 8).
; PLAN: r0=8(x), r1=8(y), r2=110(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 8
LDI r2, 110
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
