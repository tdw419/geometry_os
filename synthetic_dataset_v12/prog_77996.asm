; DESCRIPTION: Renders a blue box of size 97x104 starting at (137, 55).
; PLAN: r0=137(x), r1=55(y), r2=97(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 55
LDI r2, 97
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
