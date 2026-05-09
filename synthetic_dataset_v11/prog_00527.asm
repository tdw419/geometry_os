; DESCRIPTION: Renders a yellow box of size 25x87 starting at (31, 100).
; PLAN: r0=31(x), r1=100(y), r2=25(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 100
LDI r2, 25
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
