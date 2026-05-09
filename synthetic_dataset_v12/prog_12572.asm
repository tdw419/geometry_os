; DESCRIPTION: Composite: Draws a blue circle centered at (444, 87) with radius 46 then Draws a orange line from (85, 166) to (294, 169).
; PLAN: r0=444(x), r1=87(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x1), r6=166(y1), r7=294(x2), r8=169(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 87
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 166
LDI r7, 294
LDI r8, 169
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
