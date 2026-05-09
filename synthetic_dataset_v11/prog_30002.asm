; DESCRIPTION: Composite: . Then Creates a black circular shape at (197, 152) with radius 38. Then Sets a single black pixel at (104, 22).
; PLAN: r0=197(x), r1=152(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=104(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black circular shape at (197, 152) with radius 38.
; PLAN: r0=197(x), r1=152(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 152
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (104, 22).
; PLAN: r0=104(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 22
LDI r2, 0x000000
PSET r0, r1, r2
HALT
