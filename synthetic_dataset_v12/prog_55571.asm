; DESCRIPTION: Renders a green box of size 58x98 starting at (192, 97).
; PLAN: r0=192(x), r1=97(y), r2=58(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 97
LDI r2, 58
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
