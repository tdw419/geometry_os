; DESCRIPTION: Renders a green box of size 73x63 starting at (312, 97).
; PLAN: r0=312(x), r1=97(y), r2=73(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 97
LDI r2, 73
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
