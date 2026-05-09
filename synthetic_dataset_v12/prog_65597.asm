; DESCRIPTION: Renders a blue box of size 20x107 starting at (249, 128).
; PLAN: r0=249(x), r1=128(y), r2=20(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 128
LDI r2, 20
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
