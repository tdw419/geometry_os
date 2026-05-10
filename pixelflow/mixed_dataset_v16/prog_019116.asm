; DESCRIPTION: Composite: Draws a white circle centered at (238, 112) with radius 13 then Places a red line segment connecting (45, 110) to (74, 69) then Sets a single orange pixel at (442, 197).
; PLAN: r0=238(x), r1=112(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x1), r6=110(y1), r7=74(x2), r8=69(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=197(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 238
LDI r1, 112
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 110
LDI r7, 74
LDI r8, 69
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 197
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
