; DESCRIPTION: Renders a blue box of size 81x70 starting at (272, 142).
; PLAN: r0=272(x), r1=142(y), r2=81(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 142
LDI r2, 81
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
