; DESCRIPTION: Composite: Sets a single white pixel at (346, 91) then Creates a magenta circular shape at (71, 215) with radius 32.
; PLAN: r0=346(x), r1=91(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=71(x), r6=215(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 346
LDI r1, 91
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 71
LDI r6, 215
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
