; DESCRIPTION: Composite: Creates a blue rectangular region at (233, 154) spanning 106 by 96 pixels then Sets a single green pixel at (331, 112).
; PLAN: r0=233(x), r1=154(y), r2=106(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=112(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 233
LDI r1, 154
LDI r2, 106
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 112
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
