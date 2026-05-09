; DESCRIPTION: Composite: Places a black line segment connecting (36, 38) to (95, 44) then Renders a orange disk with center (277, 108) and radius 49 then Sets a single green pixel at (454, 107).
; PLAN: r0=36(x1), r1=38(y1), r2=95(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=108(y), r7=49(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=454(x), r11=107(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 36
LDI r1, 38
LDI r2, 95
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 108
LDI r7, 49
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 454
LDI r11, 107
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
