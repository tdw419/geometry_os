; DESCRIPTION: Composite: Sets a single black pixel at (204, 106) then Creates a green rectangular region at (260, 125) spanning 12 by 103 pixels.
; PLAN: r0=204(x), r1=106(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=125(y), r7=12(width), r8=103(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 106
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 260
LDI r6, 125
LDI r7, 12
LDI r8, 103
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
