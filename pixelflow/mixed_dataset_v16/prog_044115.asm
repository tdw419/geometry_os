; DESCRIPTION: Composite: Places a orange circle of radius 31 at center (379, 44) then Places a yellow dot at position (277, 186).
; PLAN: r0=379(x), r1=44(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=277(x), r6=186(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 44
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 277
LDI r6, 186
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
