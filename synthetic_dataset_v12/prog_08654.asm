; DESCRIPTION: Renders a green box of size 64x15 starting at (23, 110).
; PLAN: r0=23(x), r1=110(y), r2=64(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 110
LDI r2, 64
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
