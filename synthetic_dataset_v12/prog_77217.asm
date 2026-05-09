; DESCRIPTION: Renders a blue box of size 110x65 starting at (126, 176).
; PLAN: r0=126(x), r1=176(y), r2=110(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 176
LDI r2, 110
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
