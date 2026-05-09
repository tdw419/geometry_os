; DESCRIPTION: Renders a blue box of size 70x83 starting at (45, 94).
; PLAN: r0=45(x), r1=94(y), r2=70(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 94
LDI r2, 70
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
