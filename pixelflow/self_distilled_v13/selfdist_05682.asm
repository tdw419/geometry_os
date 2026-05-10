; DESCRIPTION: Places a green 88x110 box at position (253, 0).
; PLAN: r0=253(x), r1=0(y), r2=88(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 0
LDI r2, 88
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
