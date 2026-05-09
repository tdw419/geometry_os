; DESCRIPTION: Composite: Sets a single yellow pixel at (57, 250) then Places a white circle of radius 25 at center (290, 116) then Places a blue line segment connecting (180, 92) to (311, 82).
; PLAN: r0=57(x), r1=250(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=116(y), r7=25(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=180(x1), r11=92(y1), r12=311(x2), r13=82(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 250
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 290
LDI r6, 116
LDI r7, 25
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 180
LDI r11, 92
LDI r12, 311
LDI r13, 82
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
