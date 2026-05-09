; DESCRIPTION: Renders a blue box of size 19x95 starting at (333, 145).
; PLAN: r0=333(x), r1=145(y), r2=19(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 145
LDI r2, 19
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
