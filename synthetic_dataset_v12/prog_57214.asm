; DESCRIPTION: Composite: Creates a magenta rectangular region at (24, 60) spanning 63 by 100 pixels then Sets a single magenta pixel at (280, 217).
; PLAN: r0=24(x), r1=60(y), r2=63(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=217(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 24
LDI r1, 60
LDI r2, 63
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 217
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
