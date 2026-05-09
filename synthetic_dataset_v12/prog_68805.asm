; DESCRIPTION: Renders a blue box of size 118x100 starting at (293, 52).
; PLAN: r0=293(x), r1=52(y), r2=118(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 52
LDI r2, 118
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
