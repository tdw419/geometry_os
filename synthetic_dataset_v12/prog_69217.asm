; DESCRIPTION: Composite: Sets a single yellow pixel at (223, 47) then Places a white line segment connecting (65, 47) to (211, 228) then Draws a white circle centered at (153, 188) with radius 23.
; PLAN: r0=223(x), r1=47(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=65(x1), r6=47(y1), r7=211(x2), r8=228(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=188(y), r12=23(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 223
LDI r1, 47
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 65
LDI r6, 47
LDI r7, 211
LDI r8, 228
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 188
LDI r12, 23
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
