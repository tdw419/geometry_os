; DESCRIPTION: Renders a blue box of size 20x81 starting at (492, 80).
; PLAN: r0=492(x), r1=80(y), r2=20(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 80
LDI r2, 20
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
