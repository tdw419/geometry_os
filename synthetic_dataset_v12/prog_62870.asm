; DESCRIPTION: Composite: Creates a red rectangular region at (87, 110) spanning 113 by 81 pixels then Sets a single red pixel at (85, 231).
; PLAN: r0=87(x), r1=110(y), r2=113(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=231(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 87
LDI r1, 110
LDI r2, 113
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 231
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
