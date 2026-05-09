; DESCRIPTION: Composite: Creates a magenta rectangular region at (185, 103) spanning 70 by 96 pixels then Places a purple dot at position (251, 68).
; PLAN: r0=185(x), r1=103(y), r2=70(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x), r6=68(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 103
LDI r2, 70
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 68
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
