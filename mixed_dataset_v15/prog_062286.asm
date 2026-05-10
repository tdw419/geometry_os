; DESCRIPTION: Composite: Draws a red circle centered at (378, 43) with radius 40 then Draws a magenta line from (348, 204) to (422, 28).
; PLAN: r0=378(x), r1=43(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x1), r6=204(y1), r7=422(x2), r8=28(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 43
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 204
LDI r7, 422
LDI r8, 28
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
