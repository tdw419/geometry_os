; DESCRIPTION: Composite: Places a cyan circle of radius 77 at center (295, 172) then Places a magenta dot at position (248, 39).
; PLAN: r0=295(x), r1=172(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=39(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 295
LDI r1, 172
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 39
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
