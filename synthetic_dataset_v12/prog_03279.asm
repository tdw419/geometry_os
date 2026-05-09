; DESCRIPTION: Renders a blue box of size 17x56 starting at (148, 76).
; PLAN: r0=148(x), r1=76(y), r2=17(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 76
LDI r2, 17
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
