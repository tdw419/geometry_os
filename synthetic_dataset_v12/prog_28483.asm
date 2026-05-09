; DESCRIPTION: Composite: Renders a orange disk with center (415, 217) and radius 16 then Sets a single blue pixel at (293, 174).
; PLAN: r0=415(x), r1=217(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x), r6=174(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 415
LDI r1, 217
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 174
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
