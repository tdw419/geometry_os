; DESCRIPTION: Composite: Creates a black circular shape at (264, 191) with radius 40 then Draws a blue line from (270, 58) to (227, 241) then Sets a single cyan pixel at (233, 141).
; PLAN: r0=264(x), r1=191(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x1), r6=58(y1), r7=227(x2), r8=241(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=141(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 191
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 58
LDI r7, 227
LDI r8, 241
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 141
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
