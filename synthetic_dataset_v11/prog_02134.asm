; DESCRIPTION: Composite: . Then Creates a orange circular shape at (40, 223) with radius 33. Then Sets a single red pixel at (104, 137).
; PLAN: r0=40(x), r1=223(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=104(x), r1=137(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange circular shape at (40, 223) with radius 33.
; PLAN: r0=40(x), r1=223(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 223
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (104, 137).
; PLAN: r0=104(x), r1=137(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 137
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
