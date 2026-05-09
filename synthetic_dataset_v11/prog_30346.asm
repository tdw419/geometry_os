; DESCRIPTION: Places a green circle of radius 69 at center (169, 81).
; PLAN: r0=169(x), r1=81(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 81
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
