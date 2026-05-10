; DESCRIPTION: Composite: Creates a blue circular shape at (305, 103) with radius 47 then Sets a single orange pixel at (132, 189).
; PLAN: r0=305(x), r1=103(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=189(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 103
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 189
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
