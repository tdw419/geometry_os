; DESCRIPTION: Renders a blue box of size 118x98 starting at (312, 24).
; PLAN: r0=312(x), r1=24(y), r2=118(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 24
LDI r2, 118
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
