; DESCRIPTION: Renders a blue box of size 80x35 starting at (227, 124).
; PLAN: r0=227(x), r1=124(y), r2=80(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 124
LDI r2, 80
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
