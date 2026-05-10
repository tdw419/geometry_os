; DESCRIPTION: Composite: Sets a single black pixel at (54, 83) then Creates a yellow rectangular region at (183, 35) spanning 47 by 117 pixels.
; PLAN: r0=54(x), r1=83(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=35(y), r7=47(width), r8=117(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 83
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 183
LDI r6, 35
LDI r7, 47
LDI r8, 117
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
