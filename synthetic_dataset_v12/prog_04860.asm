; DESCRIPTION: Composite: Places a purple 40x21 rectangle at position (439, 64) then Sets a single cyan pixel at (331, 104).
; PLAN: r0=439(x), r1=64(y), r2=40(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=104(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 439
LDI r1, 64
LDI r2, 40
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 104
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
