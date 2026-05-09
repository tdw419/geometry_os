; DESCRIPTION: Composite: Places a red circle of radius 17 at center (108, 61) then Sets a single yellow pixel at (433, 55).
; PLAN: r0=108(x), r1=61(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x), r6=55(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 108
LDI r1, 61
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 55
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
