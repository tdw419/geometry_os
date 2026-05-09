; DESCRIPTION: Renders a blue box of size 14x105 starting at (193, 100).
; PLAN: r0=193(x), r1=100(y), r2=14(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 100
LDI r2, 14
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
