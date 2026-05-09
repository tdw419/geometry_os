; DESCRIPTION: Renders a green box of size 76x89 starting at (63, 99).
; PLAN: r0=63(x), r1=99(y), r2=76(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 99
LDI r2, 76
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
