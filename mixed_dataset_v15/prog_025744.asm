; DESCRIPTION: Composite: Places a cyan dot at position (372, 112) then Places a purple 103x58 rectangle at position (199, 179).
; PLAN: r0=372(x), r1=112(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=199(x), r6=179(y), r7=103(width), r8=58(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 112
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 199
LDI r6, 179
LDI r7, 103
LDI r8, 58
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
