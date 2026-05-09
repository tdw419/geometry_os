; DESCRIPTION: Composite: Creates a orange circular shape at (277, 122) with radius 61 then Places a cyan dot at position (279, 124).
; PLAN: r0=277(x), r1=122(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=124(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 277
LDI r1, 122
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 124
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
