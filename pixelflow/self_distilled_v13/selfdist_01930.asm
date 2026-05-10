; DESCRIPTION: Renders a green rectangular region spanning 37 by 100 at (272, 10).
; PLAN: r0=272(x), r1=10(y), r2=37(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 10
LDI r2, 37
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
