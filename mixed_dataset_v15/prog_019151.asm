; DESCRIPTION: Composite: Sets a single green pixel at (221, 52) then Creates a red rectangular region at (383, 29) spanning 115 by 25 pixels.
; PLAN: r0=221(x), r1=52(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=29(y), r7=115(width), r8=25(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 52
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 383
LDI r6, 29
LDI r7, 115
LDI r8, 25
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
