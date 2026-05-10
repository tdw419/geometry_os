; DESCRIPTION: Composite: Places a green circle of radius 79 at center (346, 139) then Sets a single red pixel at (202, 183).
; PLAN: r0=346(x), r1=139(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=183(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 346
LDI r1, 139
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 183
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
