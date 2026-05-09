; DESCRIPTION: Composite: Renders a blue disk with center (70, 60) and radius 23 then Places a green line segment connecting (363, 152) to (325, 233) then Sets a single black pixel at (188, 164).
; PLAN: r0=70(x), r1=60(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x1), r6=152(y1), r7=325(x2), r8=233(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=164(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 70
LDI r1, 60
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 152
LDI r7, 325
LDI r8, 233
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 164
LDI r12, 0x000000
PSET r10, r11, r12
HALT
