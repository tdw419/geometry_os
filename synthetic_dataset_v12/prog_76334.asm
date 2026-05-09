; DESCRIPTION: Composite: Draws a cyan line from (272, 148) to (439, 167) then Draws a cyan circle centered at (276, 155) with radius 44.
; PLAN: r0=272(x1), r1=148(y1), r2=439(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=155(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 272
LDI r1, 148
LDI r2, 439
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 155
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
