; DESCRIPTION: Composite: Renders a purple disk with center (164, 124) and radius 50 then Draws a white line from (90, 26) to (276, 147).
; PLAN: r0=164(x), r1=124(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x1), r6=26(y1), r7=276(x2), r8=147(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 124
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 26
LDI r7, 276
LDI r8, 147
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
