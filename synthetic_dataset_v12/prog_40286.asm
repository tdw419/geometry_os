; DESCRIPTION: Composite: Places a black dot at position (480, 201) then Places a cyan 118x25 rectangle at position (351, 157).
; PLAN: r0=480(x), r1=201(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=157(y), r7=118(width), r8=25(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 201
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 351
LDI r6, 157
LDI r7, 118
LDI r8, 25
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
