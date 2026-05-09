; DESCRIPTION: Renders a blue box of size 114x31 starting at (128, 122).
; PLAN: r0=128(x), r1=122(y), r2=114(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 122
LDI r2, 114
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
