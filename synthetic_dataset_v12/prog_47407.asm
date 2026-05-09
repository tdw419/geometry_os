; DESCRIPTION: Renders a green box of size 87x91 starting at (396, 100).
; PLAN: r0=396(x), r1=100(y), r2=87(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 100
LDI r2, 87
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
