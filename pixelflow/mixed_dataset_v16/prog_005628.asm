; DESCRIPTION: Composite: Sets a single orange pixel at (490, 210) then Places a purple 117x29 rectangle at position (129, 135).
; PLAN: r0=490(x), r1=210(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=129(x), r6=135(y), r7=117(width), r8=29(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 490
LDI r1, 210
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 129
LDI r6, 135
LDI r7, 117
LDI r8, 29
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
