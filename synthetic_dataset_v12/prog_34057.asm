; DESCRIPTION: Composite: Places a blue dot at position (20, 194) then Draws a blue line from (227, 50) to (36, 185) then Places a white circle of radius 61 at center (188, 62).
; PLAN: r0=20(x), r1=194(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=227(x1), r6=50(y1), r7=36(x2), r8=185(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=62(y), r12=61(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 20
LDI r1, 194
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 50
LDI r7, 36
LDI r8, 185
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 62
LDI r12, 61
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
