; DESCRIPTION: Renders a blue box of size 101x40 starting at (43, 70).
; PLAN: r0=43(x), r1=70(y), r2=101(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 70
LDI r2, 101
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
