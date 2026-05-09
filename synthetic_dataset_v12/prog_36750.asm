; DESCRIPTION: Composite: Places a red line segment connecting (27, 5) to (386, 113) then Sets a single white pixel at (364, 180) then Places a white circle of radius 35 at center (444, 170).
; PLAN: r0=27(x1), r1=5(y1), r2=386(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=180(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=444(x), r11=170(y), r12=35(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 27
LDI r1, 5
LDI r2, 386
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 180
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 444
LDI r11, 170
LDI r12, 35
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
