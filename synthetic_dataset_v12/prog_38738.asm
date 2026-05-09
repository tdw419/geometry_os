; DESCRIPTION: Renders a blue box of size 35x65 starting at (79, 20).
; PLAN: r0=79(x), r1=20(y), r2=35(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 20
LDI r2, 35
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
