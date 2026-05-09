; DESCRIPTION: Places a orange circle of radius 14 at center (249, 88).
; PLAN: r0=249(x), r1=88(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 88
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
