; DESCRIPTION: Composite: Creates a orange rectangular region at (439, 50) spanning 28 by 114 pixels then Sets a single orange pixel at (104, 74).
; PLAN: r0=439(x), r1=50(y), r2=28(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=74(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 439
LDI r1, 50
LDI r2, 28
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 74
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
