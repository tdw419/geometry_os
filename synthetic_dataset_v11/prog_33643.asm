; DESCRIPTION: Composite: . Then Creates a purple circular shape at (165, 79) with radius 32. Then Sets a single orange pixel at (186, 253).
; PLAN: r0=165(x), r1=79(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=186(x), r1=253(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple circular shape at (165, 79) with radius 32.
; PLAN: r0=165(x), r1=79(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 79
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (186, 253).
; PLAN: r0=186(x), r1=253(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 253
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
