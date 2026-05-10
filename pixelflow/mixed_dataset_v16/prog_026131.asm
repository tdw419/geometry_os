; DESCRIPTION: Renders a yellow box of size 71x66 starting at (157, 97).
; PLAN: r0=157(x), r1=97(y), r2=71(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 97
LDI r2, 71
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
