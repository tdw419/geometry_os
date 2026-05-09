; DESCRIPTION: Renders a green box of size 99x100 starting at (139, 100).
; PLAN: r0=139(x), r1=100(y), r2=99(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 100
LDI r2, 99
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
