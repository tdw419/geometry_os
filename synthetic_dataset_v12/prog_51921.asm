; DESCRIPTION: Renders a green box of size 17x25 starting at (292, 201).
; PLAN: r0=292(x), r1=201(y), r2=17(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 201
LDI r2, 17
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
