; DESCRIPTION: Composite: Creates a blue rectangular region at (91, 160) spanning 87 by 34 pixels then Places a blue dot at position (56, 192).
; PLAN: r0=91(x), r1=160(y), r2=87(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=192(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 91
LDI r1, 160
LDI r2, 87
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 192
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
