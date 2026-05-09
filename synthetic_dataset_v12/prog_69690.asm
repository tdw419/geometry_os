; DESCRIPTION: Renders a blue box of size 13x74 starting at (185, 104).
; PLAN: r0=185(x), r1=104(y), r2=13(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 104
LDI r2, 13
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
