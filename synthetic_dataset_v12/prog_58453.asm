; DESCRIPTION: Composite: Places a white circle of radius 22 at center (204, 194) then Draws a blue line from (227, 211) to (347, 160).
; PLAN: r0=204(x), r1=194(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x1), r6=211(y1), r7=347(x2), r8=160(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 194
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 211
LDI r7, 347
LDI r8, 160
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
