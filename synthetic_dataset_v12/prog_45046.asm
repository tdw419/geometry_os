; DESCRIPTION: Renders a yellow box of size 19x31 starting at (361, 97).
; PLAN: r0=361(x), r1=97(y), r2=19(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 97
LDI r2, 19
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
