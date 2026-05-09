; DESCRIPTION: Renders a green box of size 37x10 starting at (2, 9).
; PLAN: r0=2(x), r1=9(y), r2=37(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 9
LDI r2, 37
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
