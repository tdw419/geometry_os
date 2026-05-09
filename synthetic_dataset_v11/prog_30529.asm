; DESCRIPTION: Renders a green box of size 52x37 starting at (175, 201).
; PLAN: r0=175(x), r1=201(y), r2=52(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 201
LDI r2, 52
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
