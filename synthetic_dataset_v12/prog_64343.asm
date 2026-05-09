; DESCRIPTION: Composite: Renders a red disk with center (204, 150) and radius 37 then Draws a black line from (314, 238) to (370, 77).
; PLAN: r0=204(x), r1=150(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x1), r6=238(y1), r7=370(x2), r8=77(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 150
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 238
LDI r7, 370
LDI r8, 77
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
