; DESCRIPTION: Places a orange circle of radius 38 at center (416, 88).
; PLAN: r0=416(x), r1=88(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 88
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
