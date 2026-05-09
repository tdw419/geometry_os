; DESCRIPTION: Composite: Draws a blue circle centered at (301, 119) with radius 39 then Renders a red line between points (145, 77) and (389, 57).
; PLAN: r0=301(x), r1=119(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x1), r6=77(y1), r7=389(x2), r8=57(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 119
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 77
LDI r7, 389
LDI r8, 57
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
