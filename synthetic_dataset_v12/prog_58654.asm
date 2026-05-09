; DESCRIPTION: Renders a blue box of size 33x43 starting at (56, 70).
; PLAN: r0=56(x), r1=70(y), r2=33(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 70
LDI r2, 33
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
