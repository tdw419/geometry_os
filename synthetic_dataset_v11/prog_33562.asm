; DESCRIPTION: Composite: . Then Sets a single white pixel at (152, 7). Then Creates a orange circular shape at (43, 162) with radius 32.
; PLAN: r0=152(x), r1=7(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=43(x), r1=162(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (152, 7).
; PLAN: r0=152(x), r1=7(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 7
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a orange circular shape at (43, 162) with radius 32.
; PLAN: r0=43(x), r1=162(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 162
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
