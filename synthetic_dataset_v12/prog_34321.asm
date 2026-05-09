; DESCRIPTION: Composite: Renders a yellow disk with center (311, 143) and radius 77 then Draws a blue line from (437, 143) to (389, 34).
; PLAN: r0=311(x), r1=143(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x1), r6=143(y1), r7=389(x2), r8=34(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 143
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 143
LDI r7, 389
LDI r8, 34
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
