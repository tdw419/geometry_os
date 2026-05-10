; DESCRIPTION: Composite: Places a red dot at position (292, 17) then Creates a yellow rectangular region at (83, 202) spanning 78 by 46 pixels.
; PLAN: r0=292(x), r1=17(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=202(y), r7=78(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 17
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 83
LDI r6, 202
LDI r7, 78
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
