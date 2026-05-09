; DESCRIPTION: Renders a blue box of size 119x63 starting at (75, 156).
; PLAN: r0=75(x), r1=156(y), r2=119(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 156
LDI r2, 119
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
