; DESCRIPTION: Composite: Creates a cyan circular shape at (311, 174) with radius 76 then Draws a white line from (315, 156) to (463, 46).
; PLAN: r0=311(x), r1=174(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x1), r6=156(y1), r7=463(x2), r8=46(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 174
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 156
LDI r7, 463
LDI r8, 46
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
