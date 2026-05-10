; DESCRIPTION: Creates a green circular shape at (169, 194) with radius 14.
; PLAN: r0=169(x), r1=194(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 194
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
