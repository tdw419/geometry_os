; DESCRIPTION: Renders a blue box of size 118x72 starting at (256, 35).
; PLAN: r0=256(x), r1=35(y), r2=118(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 35
LDI r2, 118
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
