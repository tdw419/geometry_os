; DESCRIPTION: Composite: Sets a single orange pixel at (464, 11) then Places a orange 80x89 rectangle at position (245, 2).
; PLAN: r0=464(x), r1=11(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=2(y), r7=80(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 11
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 245
LDI r6, 2
LDI r7, 80
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
