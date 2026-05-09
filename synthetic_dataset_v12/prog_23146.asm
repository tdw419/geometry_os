; DESCRIPTION: Renders a yellow box of size 116x31 starting at (67, 110).
; PLAN: r0=67(x), r1=110(y), r2=116(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 110
LDI r2, 116
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
