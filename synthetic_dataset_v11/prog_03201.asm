; DESCRIPTION: Renders a blue box of size 54x58 starting at (19, 80).
; PLAN: r0=19(x), r1=80(y), r2=54(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 80
LDI r2, 54
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
