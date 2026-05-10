; DESCRIPTION: Composite: Places a black circle of radius 61 at center (388, 61) then Places a red line segment connecting (15, 90) to (198, 108) then Sets a single white pixel at (370, 90).
; PLAN: r0=388(x), r1=61(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x1), r6=90(y1), r7=198(x2), r8=108(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=370(x), r11=90(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 388
LDI r1, 61
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 90
LDI r7, 198
LDI r8, 108
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 90
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
