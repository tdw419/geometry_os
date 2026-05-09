; DESCRIPTION: Composite: Places a black line segment connecting (410, 218) to (381, 18) then Renders a blue disk with center (393, 143) and radius 74 then Sets a single yellow pixel at (338, 107).
; PLAN: r0=410(x1), r1=218(y1), r2=381(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=143(y), r7=74(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x), r11=107(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 410
LDI r1, 218
LDI r2, 381
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 143
LDI r7, 74
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 107
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
