; DESCRIPTION: Composite: Renders a orange disk with center (337, 91) and radius 52 then Draws a red line from (372, 153) to (490, 103).
; PLAN: r0=337(x), r1=91(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x1), r6=153(y1), r7=490(x2), r8=103(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 91
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 153
LDI r7, 490
LDI r8, 103
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
