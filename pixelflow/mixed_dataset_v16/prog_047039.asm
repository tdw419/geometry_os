; DESCRIPTION: Renders a green box of size 110x29 starting at (246, 97).
; PLAN: r0=246(x), r1=97(y), r2=110(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 97
LDI r2, 110
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
