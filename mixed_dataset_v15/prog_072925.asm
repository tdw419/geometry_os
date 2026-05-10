; DESCRIPTION: Composite: Creates a red circular shape at (199, 104) with radius 47 then Places a cyan line segment connecting (125, 164) to (436, 160) then Sets a single green pixel at (388, 105).
; PLAN: r0=199(x), r1=104(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x1), r6=164(y1), r7=436(x2), r8=160(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=388(x), r11=105(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 104
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 164
LDI r7, 436
LDI r8, 160
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 105
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
