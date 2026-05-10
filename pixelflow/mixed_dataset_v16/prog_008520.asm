; DESCRIPTION: Composite: Renders a yellow disk with center (472, 26) and radius 10 then Renders a white line between points (232, 181) and (50, 196).
; PLAN: r0=472(x), r1=26(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x1), r6=181(y1), r7=50(x2), r8=196(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 472
LDI r1, 26
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 181
LDI r7, 50
LDI r8, 196
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
