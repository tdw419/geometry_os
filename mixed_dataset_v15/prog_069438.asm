; DESCRIPTION: Composite: Renders a white disk with center (351, 178) and radius 77 then Draws a yellow line from (454, 25) to (278, 187).
; PLAN: r0=351(x), r1=178(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x1), r6=25(y1), r7=278(x2), r8=187(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 178
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 25
LDI r7, 278
LDI r8, 187
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
