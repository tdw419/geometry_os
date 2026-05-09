; DESCRIPTION: Composite: Renders a orange disk with center (323, 53) and radius 22 then Draws a purple line from (264, 54) to (274, 255).
; PLAN: r0=323(x), r1=53(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x1), r6=54(y1), r7=274(x2), r8=255(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 53
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 54
LDI r7, 274
LDI r8, 255
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
