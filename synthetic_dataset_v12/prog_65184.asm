; DESCRIPTION: Renders a blue box of size 45x75 starting at (65, 33).
; PLAN: r0=65(x), r1=33(y), r2=45(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 33
LDI r2, 45
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
