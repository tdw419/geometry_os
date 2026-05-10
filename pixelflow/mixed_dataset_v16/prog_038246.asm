; DESCRIPTION: Composite: Sets a single green pixel at (159, 54) then Places a cyan 65x36 rectangle at position (241, 208).
; PLAN: r0=159(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=208(y), r7=65(width), r8=36(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 54
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 241
LDI r6, 208
LDI r7, 65
LDI r8, 36
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
