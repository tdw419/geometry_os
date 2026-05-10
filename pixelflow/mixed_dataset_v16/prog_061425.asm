; DESCRIPTION: Renders a green box of size 100x23 starting at (271, 110).
; PLAN: r0=271(x), r1=110(y), r2=100(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 110
LDI r2, 100
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
