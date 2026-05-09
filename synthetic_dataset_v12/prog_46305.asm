; DESCRIPTION: Composite: Creates a black rectangular region at (190, 68) spanning 55 by 65 pixels then Sets a single orange pixel at (415, 104).
; PLAN: r0=190(x), r1=68(y), r2=55(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=104(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 190
LDI r1, 68
LDI r2, 55
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 104
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
