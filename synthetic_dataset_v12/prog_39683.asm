; DESCRIPTION: Composite: Places a green circle of radius 80 at center (177, 150) then Places a yellow line segment connecting (258, 123) to (227, 202).
; PLAN: r0=177(x), r1=150(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x1), r6=123(y1), r7=227(x2), r8=202(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 177
LDI r1, 150
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 123
LDI r7, 227
LDI r8, 202
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
