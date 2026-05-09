; DESCRIPTION: Composite: Sets a single yellow pixel at (287, 237) then Places a yellow 117x79 rectangle at position (297, 109).
; PLAN: r0=287(x), r1=237(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=109(y), r7=117(width), r8=79(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 237
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 297
LDI r6, 109
LDI r7, 117
LDI r8, 79
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
