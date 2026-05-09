; DESCRIPTION: Composite: Sets a single green pixel at (308, 44) then Creates a blue rectangular region at (52, 91) spanning 14 by 41 pixels.
; PLAN: r0=308(x), r1=44(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=52(x), r6=91(y), r7=14(width), r8=41(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 44
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 52
LDI r6, 91
LDI r7, 14
LDI r8, 41
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
