; DESCRIPTION: Composite: Sets a single orange pixel at (412, 207) then Creates a cyan circular shape at (176, 120) with radius 61.
; PLAN: r0=412(x), r1=207(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=120(y), r7=61(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 412
LDI r1, 207
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 176
LDI r6, 120
LDI r7, 61
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
