; DESCRIPTION: Renders a blue rectangular region spanning 120 by 76 at (234, 22).
; PLAN: r0=234(x), r1=22(y), r2=120(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 22
LDI r2, 120
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
