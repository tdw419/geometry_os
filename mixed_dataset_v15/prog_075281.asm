; DESCRIPTION: Composite: Places a white circle of radius 44 at center (220, 189) then Places a orange dot at position (397, 222).
; PLAN: r0=220(x), r1=189(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=222(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 220
LDI r1, 189
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 222
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
