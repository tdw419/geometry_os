; DESCRIPTION: Composite: Renders a yellow disk with center (423, 217) and radius 13 then Places a blue line segment connecting (253, 230) to (345, 123) then Sets a single green pixel at (129, 28).
; PLAN: r0=423(x), r1=217(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x1), r6=230(y1), r7=345(x2), r8=123(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=28(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 423
LDI r1, 217
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 230
LDI r7, 345
LDI r8, 123
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 28
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
