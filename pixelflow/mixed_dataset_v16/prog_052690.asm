; DESCRIPTION: Renders a blue box of size 75x94 starting at (104, 148).
; PLAN: r0=104(x), r1=148(y), r2=75(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 148
LDI r2, 75
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
