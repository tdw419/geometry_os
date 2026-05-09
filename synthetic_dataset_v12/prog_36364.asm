; DESCRIPTION: Composite: Creates a green rectangular region at (23, 97) spanning 23 by 109 pixels then Places a purple dot at position (118, 192).
; PLAN: r0=23(x), r1=97(y), r2=23(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=192(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 23
LDI r1, 97
LDI r2, 23
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 192
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
