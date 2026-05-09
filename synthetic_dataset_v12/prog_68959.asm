; DESCRIPTION: Composite: Renders a yellow disk with center (143, 181) and radius 49 then Draws a green line from (388, 102) to (222, 124).
; PLAN: r0=143(x), r1=181(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=388(x1), r6=102(y1), r7=222(x2), r8=124(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 181
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 388
LDI r6, 102
LDI r7, 222
LDI r8, 124
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
