; DESCRIPTION: Composite: Creates a white rectangular region at (259, 1) spanning 112 by 60 pixels then Sets a single purple pixel at (123, 97).
; PLAN: r0=259(x), r1=1(y), r2=112(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=97(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 259
LDI r1, 1
LDI r2, 112
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 97
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
