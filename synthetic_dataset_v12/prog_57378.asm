; DESCRIPTION: Renders a blue box of size 36x70 starting at (417, 159).
; PLAN: r0=417(x), r1=159(y), r2=36(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 159
LDI r2, 36
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
