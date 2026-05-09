; DESCRIPTION: Renders a blue box of size 99x106 starting at (193, 145).
; PLAN: r0=193(x), r1=145(y), r2=99(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 145
LDI r2, 99
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
