; DESCRIPTION: Composite: Places a white circle of radius 43 at center (229, 194) then Sets a single orange pixel at (305, 26).
; PLAN: r0=229(x), r1=194(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=26(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 194
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 26
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
