; DESCRIPTION: Renders a blue box of size 16x85 starting at (351, 156).
; PLAN: r0=351(x), r1=156(y), r2=16(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 156
LDI r2, 16
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
