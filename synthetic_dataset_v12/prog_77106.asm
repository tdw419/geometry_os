; DESCRIPTION: Renders a green box of size 100x63 starting at (249, 76).
; PLAN: r0=249(x), r1=76(y), r2=100(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 76
LDI r2, 100
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
