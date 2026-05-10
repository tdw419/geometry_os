; DESCRIPTION: Composite: Places a black dot at position (407, 246) then Creates a green rectangular region at (3, 185) spanning 18 by 27 pixels.
; PLAN: r0=407(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=3(x), r6=185(y), r7=18(width), r8=27(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 407
LDI r1, 246
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 3
LDI r6, 185
LDI r7, 18
LDI r8, 27
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
