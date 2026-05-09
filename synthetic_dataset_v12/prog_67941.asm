; DESCRIPTION: Composite: Places a white line segment connecting (347, 40) to (492, 191) then Renders a white disk with center (290, 85) and radius 73 then Sets a single white pixel at (476, 70).
; PLAN: r0=347(x1), r1=40(y1), r2=492(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=290(x), r6=85(y), r7=73(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=476(x), r11=70(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 40
LDI r2, 492
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 85
LDI r7, 73
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 476
LDI r11, 70
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
