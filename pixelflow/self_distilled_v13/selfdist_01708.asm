; DESCRIPTION: Renders a white circular shape at (273, 155) with radius 69.
; PLAN: r0=273(x), r1=155(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 155
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
