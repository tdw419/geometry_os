; DESCRIPTION: Composite: Sets a single black pixel at (234, 149) then Places a black 60x45 rectangle at position (373, 7).
; PLAN: r0=234(x), r1=149(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=7(y), r7=60(width), r8=45(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 149
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 373
LDI r6, 7
LDI r7, 60
LDI r8, 45
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
