; DESCRIPTION: Composite: Sets a single yellow pixel at (327, 186) then Places a magenta 14x81 rectangle at position (413, 51).
; PLAN: r0=327(x), r1=186(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=51(y), r7=14(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 186
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 413
LDI r6, 51
LDI r7, 14
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
