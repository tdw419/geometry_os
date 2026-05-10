; DESCRIPTION: Composite: Creates a black circular shape at (186, 143) with radius 54 then Draws a orange line from (302, 5) to (286, 81).
; PLAN: r0=186(x), r1=143(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x1), r6=5(y1), r7=286(x2), r8=81(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 143
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 5
LDI r7, 286
LDI r8, 81
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
