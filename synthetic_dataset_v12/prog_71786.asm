; DESCRIPTION: Renders a blue box of size 18x54 starting at (132, 19).
; PLAN: r0=132(x), r1=19(y), r2=18(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 19
LDI r2, 18
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
