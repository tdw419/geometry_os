; DESCRIPTION: Renders a blue box of size 114x68 starting at (351, 144).
; PLAN: r0=351(x), r1=144(y), r2=114(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 144
LDI r2, 114
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
