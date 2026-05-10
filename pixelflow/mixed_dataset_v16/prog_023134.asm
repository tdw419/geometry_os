; DESCRIPTION: Composite: Places a purple 78x44 rectangle at position (251, 173) then Sets a single purple pixel at (493, 4).
; PLAN: r0=251(x), r1=173(y), r2=78(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=493(x), r6=4(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 251
LDI r1, 173
LDI r2, 78
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 493
LDI r6, 4
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
