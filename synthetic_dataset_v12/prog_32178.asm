; DESCRIPTION: Composite: Sets a single green pixel at (36, 171) then Draws a cyan line from (381, 151) to (19, 66) then Creates a orange circular shape at (197, 182) with radius 60.
; PLAN: r0=36(x), r1=171(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=381(x1), r6=151(y1), r7=19(x2), r8=66(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=182(y), r12=60(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 36
LDI r1, 171
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 381
LDI r6, 151
LDI r7, 19
LDI r8, 66
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 182
LDI r12, 60
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
