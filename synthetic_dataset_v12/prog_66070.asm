; DESCRIPTION: Composite: Sets a single purple pixel at (476, 61) then Creates a cyan rectangular region at (381, 117) spanning 87 by 99 pixels.
; PLAN: r0=476(x), r1=61(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=117(y), r7=87(width), r8=99(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 61
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 381
LDI r6, 117
LDI r7, 87
LDI r8, 99
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
