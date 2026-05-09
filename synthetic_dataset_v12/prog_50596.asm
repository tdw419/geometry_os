; DESCRIPTION: Composite: Places a orange circle of radius 22 at center (454, 96) then Places a blue dot at position (229, 165).
; PLAN: r0=454(x), r1=96(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=165(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 454
LDI r1, 96
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 165
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
