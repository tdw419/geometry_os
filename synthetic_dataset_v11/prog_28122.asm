; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (152, 119) with radius 47. Then Sets a single black pixel at (29, 33).
; PLAN: r0=152(x), r1=119(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=29(x), r1=33(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (152, 119) with radius 47.
; PLAN: r0=152(x), r1=119(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 119
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (29, 33).
; PLAN: r0=29(x), r1=33(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 33
LDI r2, 0x000000
PSET r0, r1, r2
HALT
