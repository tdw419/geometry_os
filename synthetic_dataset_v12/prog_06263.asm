; DESCRIPTION: Composite: Sets a single cyan pixel at (320, 153) then Places a purple 66x75 rectangle at position (94, 83).
; PLAN: r0=320(x), r1=153(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=83(y), r7=66(width), r8=75(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 153
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 94
LDI r6, 83
LDI r7, 66
LDI r8, 75
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
