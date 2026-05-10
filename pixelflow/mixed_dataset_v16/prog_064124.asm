; DESCRIPTION: Composite: Places a green circle of radius 62 at center (194, 169) then Places a yellow line segment connecting (437, 88) to (95, 89).
; PLAN: r0=194(x), r1=169(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x1), r6=88(y1), r7=95(x2), r8=89(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 169
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 88
LDI r7, 95
LDI r8, 89
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
