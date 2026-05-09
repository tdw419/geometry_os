; DESCRIPTION: Composite: Places a red dot at position (268, 159) then Creates a green rectangular region at (186, 47) spanning 24 by 17 pixels.
; PLAN: r0=268(x), r1=159(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=47(y), r7=24(width), r8=17(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 159
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 186
LDI r6, 47
LDI r7, 24
LDI r8, 17
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
