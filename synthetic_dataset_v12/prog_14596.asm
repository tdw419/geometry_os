; DESCRIPTION: Composite: Sets a single magenta pixel at (383, 62) then Creates a orange circular shape at (277, 141) with radius 72.
; PLAN: r0=383(x), r1=62(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=141(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 383
LDI r1, 62
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 277
LDI r6, 141
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
