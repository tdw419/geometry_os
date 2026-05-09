; DESCRIPTION: Composite: Places a purple 51x87 rectangle at position (335, 75) then Sets a single green pixel at (504, 214).
; PLAN: r0=335(x), r1=75(y), r2=51(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x), r6=214(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 75
LDI r2, 51
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 214
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
