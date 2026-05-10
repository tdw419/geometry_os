; DESCRIPTION: Composite: Creates a magenta rectangular region at (94, 86) spanning 80 by 90 pixels then Sets a single red pixel at (335, 1).
; PLAN: r0=94(x), r1=86(y), r2=80(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x), r6=1(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 94
LDI r1, 86
LDI r2, 80
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 1
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
