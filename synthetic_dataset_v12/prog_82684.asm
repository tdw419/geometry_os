; DESCRIPTION: Renders a blue box of size 52x60 starting at (312, 78).
; PLAN: r0=312(x), r1=78(y), r2=52(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 78
LDI r2, 52
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
