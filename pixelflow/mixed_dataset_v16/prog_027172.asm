; DESCRIPTION: Composite: Draws a orange circle centered at (305, 126) with radius 45 then Draws a red line from (190, 211) to (408, 115).
; PLAN: r0=305(x), r1=126(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x1), r6=211(y1), r7=408(x2), r8=115(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 126
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 211
LDI r7, 408
LDI r8, 115
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
