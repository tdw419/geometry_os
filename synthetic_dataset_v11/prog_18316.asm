; DESCRIPTION: Renders a blue box of size 115x30 starting at (11, 123).
; PLAN: r0=11(x), r1=123(y), r2=115(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 123
LDI r2, 115
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
