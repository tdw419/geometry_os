; DESCRIPTION: Composite: Sets a single black pixel at (239, 167) then Renders a black line between points (504, 121) and (423, 80) then Places a black circle of radius 69 at center (300, 107).
; PLAN: r0=239(x), r1=167(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=504(x1), r6=121(y1), r7=423(x2), r8=80(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=300(x), r11=107(y), r12=69(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 239
LDI r1, 167
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 504
LDI r6, 121
LDI r7, 423
LDI r8, 80
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 107
LDI r12, 69
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
