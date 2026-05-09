; DESCRIPTION: Composite: Draws a black line from (211, 210) to (332, 122) then Sets a single blue pixel at (458, 40) then Renders a white disk with center (443, 116) and radius 58.
; PLAN: r0=211(x1), r1=210(y1), r2=332(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=40(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=443(x), r11=116(y), r12=58(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 210
LDI r2, 332
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 40
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 443
LDI r11, 116
LDI r12, 58
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
