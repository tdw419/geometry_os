; DESCRIPTION: Renders a blue box of size 43x104 starting at (354, 110).
; PLAN: r0=354(x), r1=110(y), r2=43(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 110
LDI r2, 43
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
