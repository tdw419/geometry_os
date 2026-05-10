; DESCRIPTION: Composite: Renders a yellow disk with center (266, 123) and radius 75 then Draws a red line from (90, 209) to (463, 168).
; PLAN: r0=266(x), r1=123(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x1), r6=209(y1), r7=463(x2), r8=168(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 123
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 209
LDI r7, 463
LDI r8, 168
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
