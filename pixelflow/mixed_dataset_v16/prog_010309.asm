; DESCRIPTION: Composite: Sets a single white pixel at (198, 108) then Creates a magenta circular shape at (469, 160) with radius 24.
; PLAN: r0=198(x), r1=108(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=469(x), r6=160(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 108
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 469
LDI r6, 160
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
