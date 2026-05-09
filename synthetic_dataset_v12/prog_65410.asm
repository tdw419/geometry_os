; DESCRIPTION: Composite: Draws a white line from (437, 86) to (199, 204) then Places a black dot at position (321, 70) then Renders a blue disk with center (317, 75) and radius 44.
; PLAN: r0=437(x1), r1=86(y1), r2=199(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=70(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=317(x), r11=75(y), r12=44(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 437
LDI r1, 86
LDI r2, 199
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 70
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 317
LDI r11, 75
LDI r12, 44
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
