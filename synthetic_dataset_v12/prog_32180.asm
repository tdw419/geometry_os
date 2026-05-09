; DESCRIPTION: Renders a green box of size 10x110 starting at (149, 115).
; PLAN: r0=149(x), r1=115(y), r2=10(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 115
LDI r2, 10
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
