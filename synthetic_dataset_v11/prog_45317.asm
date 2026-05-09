; DESCRIPTION: Renders a green box of size 80x119 starting at (5, 108).
; PLAN: r0=5(x), r1=108(y), r2=80(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 108
LDI r2, 80
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
