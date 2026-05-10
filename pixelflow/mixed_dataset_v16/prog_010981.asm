; DESCRIPTION: Composite: Draws a blue line from (302, 211) to (321, 43) then Renders a white disk with center (418, 196) and radius 41.
; PLAN: r0=302(x1), r1=211(y1), r2=321(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=196(y), r7=41(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 302
LDI r1, 211
LDI r2, 321
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 196
LDI r7, 41
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
