; DESCRIPTION: Draws a white circle centered at (170, 169) with radius 80.
; PLAN: r0=170(x), r1=169(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 169
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
