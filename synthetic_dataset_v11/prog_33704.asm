; DESCRIPTION: Composite: . Then Sets a single orange pixel at (142, 185). Then Creates a purple rectangular region at (116, 174) spanning 75 by 49 pixels.
; PLAN: r0=142(x), r1=185(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=116(x), r1=174(y), r2=75(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (142, 185).
; PLAN: r0=142(x), r1=185(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 185
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (116, 174) spanning 75 by 49 pixels.
; PLAN: r0=116(x), r1=174(y), r2=75(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 174
LDI r2, 75
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
