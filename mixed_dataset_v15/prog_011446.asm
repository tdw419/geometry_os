; DESCRIPTION: Renders a blue box of size 78x34 starting at (351, 86).
; PLAN: r0=351(x), r1=86(y), r2=78(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 86
LDI r2, 78
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
