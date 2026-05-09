; DESCRIPTION: Renders a yellow box of size 49x81 starting at (371, 7).
; PLAN: r0=371(x), r1=7(y), r2=49(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 7
LDI r2, 49
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
