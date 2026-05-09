; DESCRIPTION: Creates a green circular shape at (395, 155) with radius 59.
; PLAN: r0=395(x), r1=155(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 155
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
