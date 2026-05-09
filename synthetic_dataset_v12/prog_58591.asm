; DESCRIPTION: Composite: Creates a blue circular shape at (273, 169) with radius 17 then Renders a black line between points (260, 18) and (175, 242).
; PLAN: r0=273(x), r1=169(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x1), r6=18(y1), r7=175(x2), r8=242(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 169
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 18
LDI r7, 175
LDI r8, 242
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
