; DESCRIPTION: Composite: Sets a single orange pixel at (359, 61) then Places a blue line segment connecting (204, 92) to (246, 150) then Renders a purple disk with center (480, 113) and radius 25.
; PLAN: r0=359(x), r1=61(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=92(y1), r7=246(x2), r8=150(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=480(x), r11=113(y), r12=25(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 359
LDI r1, 61
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 204
LDI r6, 92
LDI r7, 246
LDI r8, 150
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 480
LDI r11, 113
LDI r12, 25
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
