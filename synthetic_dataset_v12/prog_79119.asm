; DESCRIPTION: Composite: Draws a yellow circle centered at (120, 74) with radius 58 then Renders a white line between points (319, 135) and (83, 20).
; PLAN: r0=120(x), r1=74(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x1), r6=135(y1), r7=83(x2), r8=20(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 74
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 135
LDI r7, 83
LDI r8, 20
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
