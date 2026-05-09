; DESCRIPTION: Renders a blue box of size 118x102 starting at (13, 133).
; PLAN: r0=13(x), r1=133(y), r2=118(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 133
LDI r2, 118
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
