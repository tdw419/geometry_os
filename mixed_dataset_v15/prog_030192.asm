; DESCRIPTION: Renders a blue box of size 84x110 starting at (0, 104).
; PLAN: r0=0(x), r1=104(y), r2=84(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 104
LDI r2, 84
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
