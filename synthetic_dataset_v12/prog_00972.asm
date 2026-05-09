; DESCRIPTION: Composite: Draws a white line from (317, 174) to (372, 105) then Renders a green disk with center (60, 112) and radius 56.
; PLAN: r0=317(x1), r1=174(y1), r2=372(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=112(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 317
LDI r1, 174
LDI r2, 372
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 112
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
