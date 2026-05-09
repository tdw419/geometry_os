; DESCRIPTION: Composite: Places a orange line segment connecting (285, 220) to (50, 182) then Places a blue dot at position (372, 238) then Creates a orange circular shape at (386, 230) with radius 25.
; PLAN: r0=285(x1), r1=220(y1), r2=50(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=238(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=386(x), r11=230(y), r12=25(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 220
LDI r2, 50
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 238
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 386
LDI r11, 230
LDI r12, 25
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
