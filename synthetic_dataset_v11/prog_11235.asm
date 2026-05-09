; DESCRIPTION: Renders a green box of size 22x65 starting at (63, 149).
; PLAN: r0=63(x), r1=149(y), r2=22(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 149
LDI r2, 22
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
