; DESCRIPTION: Renders a blue box of size 100x10 starting at (65, 70).
; PLAN: r0=65(x), r1=70(y), r2=100(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 70
LDI r2, 100
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
