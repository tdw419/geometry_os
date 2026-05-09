; DESCRIPTION: Composite: Sets a single orange pixel at (165, 217) then Places a green circle of radius 59 at center (305, 131).
; PLAN: r0=165(x), r1=217(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=131(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 165
LDI r1, 217
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 305
LDI r6, 131
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
