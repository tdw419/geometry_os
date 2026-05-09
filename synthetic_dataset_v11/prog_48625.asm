; DESCRIPTION: Renders a blue box of size 84x104 starting at (132, 142).
; PLAN: r0=132(x), r1=142(y), r2=84(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 142
LDI r2, 84
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
