; DESCRIPTION: Composite: Sets a single blue pixel at (205, 47) then Places a purple 23x86 rectangle at position (131, 145).
; PLAN: r0=205(x), r1=47(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=145(y), r7=23(width), r8=86(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 47
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 145
LDI r7, 23
LDI r8, 86
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
