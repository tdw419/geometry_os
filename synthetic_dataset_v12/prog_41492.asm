; DESCRIPTION: Composite: Places a yellow dot at position (346, 24) then Creates a purple circular shape at (69, 123) with radius 57.
; PLAN: r0=346(x), r1=24(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=69(x), r6=123(y), r7=57(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 346
LDI r1, 24
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 69
LDI r6, 123
LDI r7, 57
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
