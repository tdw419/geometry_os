; DESCRIPTION: Composite: Sets a single orange pixel at (297, 82) then Places a yellow 118x38 rectangle at position (372, 210).
; PLAN: r0=297(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=210(y), r7=118(width), r8=38(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 82
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 372
LDI r6, 210
LDI r7, 118
LDI r8, 38
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
