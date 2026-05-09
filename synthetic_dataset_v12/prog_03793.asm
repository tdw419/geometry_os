; DESCRIPTION: Composite: Sets a single cyan pixel at (449, 80) then Creates a red rectangular region at (34, 25) spanning 73 by 16 pixels.
; PLAN: r0=449(x), r1=80(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=34(x), r6=25(y), r7=73(width), r8=16(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 449
LDI r1, 80
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 34
LDI r6, 25
LDI r7, 73
LDI r8, 16
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
