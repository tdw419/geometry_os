; DESCRIPTION: Renders a blue box of size 85x105 starting at (359, 8).
; PLAN: r0=359(x), r1=8(y), r2=85(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 8
LDI r2, 85
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
