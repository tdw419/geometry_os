; DESCRIPTION: Renders a green box of size 58x58 starting at (250, 149).
; PLAN: r0=250(x), r1=149(y), r2=58(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 149
LDI r2, 58
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
