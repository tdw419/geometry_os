; DESCRIPTION: Renders a blue box of size 75x20 starting at (193, 137).
; PLAN: r0=193(x), r1=137(y), r2=75(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 137
LDI r2, 75
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
