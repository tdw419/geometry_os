; DESCRIPTION: Renders a blue box of size 35x120 starting at (311, 23).
; PLAN: r0=311(x), r1=23(y), r2=35(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 23
LDI r2, 35
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
