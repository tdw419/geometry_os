; DESCRIPTION: Composite: Renders a yellow disk with center (303, 125) and radius 72 then Draws a black line from (229, 15) to (459, 247).
; PLAN: r0=303(x), r1=125(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x1), r6=15(y1), r7=459(x2), r8=247(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 125
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 15
LDI r7, 459
LDI r8, 247
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
