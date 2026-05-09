; DESCRIPTION: Renders a blue box of size 80x44 starting at (312, 130).
; PLAN: r0=312(x), r1=130(y), r2=80(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 130
LDI r2, 80
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
