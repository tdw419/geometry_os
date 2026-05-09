; DESCRIPTION: Renders a green box of size 97x64 starting at (44, 110).
; PLAN: r0=44(x), r1=110(y), r2=97(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 110
LDI r2, 97
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
