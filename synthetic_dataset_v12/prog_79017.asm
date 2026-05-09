; DESCRIPTION: Creates a green circular shape at (249, 114) with radius 58.
; PLAN: r0=249(x), r1=114(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 114
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
