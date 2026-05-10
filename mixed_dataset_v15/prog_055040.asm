; DESCRIPTION: Composite: Sets a single orange pixel at (129, 151) then Places a red 104x47 rectangle at position (42, 160).
; PLAN: r0=129(x), r1=151(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=160(y), r7=104(width), r8=47(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 151
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 42
LDI r6, 160
LDI r7, 104
LDI r8, 47
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
