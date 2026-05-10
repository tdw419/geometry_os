; DESCRIPTION: Renders a green box of size 23x69 starting at (323, 63).
; PLAN: r0=323(x), r1=63(y), r2=23(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 63
LDI r2, 23
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
