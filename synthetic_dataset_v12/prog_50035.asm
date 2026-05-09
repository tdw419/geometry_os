; DESCRIPTION: Composite: Sets a single red pixel at (200, 30) then Creates a cyan rectangular region at (448, 121) spanning 16 by 36 pixels.
; PLAN: r0=200(x), r1=30(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=448(x), r6=121(y), r7=16(width), r8=36(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 30
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 448
LDI r6, 121
LDI r7, 16
LDI r8, 36
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
