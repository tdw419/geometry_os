; DESCRIPTION: Composite: Sets a single orange pixel at (164, 186) then Places a green circle of radius 49 at center (392, 62).
; PLAN: r0=164(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=62(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 164
LDI r1, 186
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 392
LDI r6, 62
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
