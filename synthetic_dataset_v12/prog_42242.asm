; DESCRIPTION: Composite: Sets a single orange pixel at (200, 80) then Places a yellow 14x96 rectangle at position (236, 53).
; PLAN: r0=200(x), r1=80(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=53(y), r7=14(width), r8=96(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 80
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 236
LDI r6, 53
LDI r7, 14
LDI r8, 96
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
