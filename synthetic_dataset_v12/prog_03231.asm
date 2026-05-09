; DESCRIPTION: Draws a cyan circle centered at (191, 88) with radius 70.
; PLAN: r0=191(x), r1=88(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 88
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
