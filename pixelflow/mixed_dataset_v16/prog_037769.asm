; DESCRIPTION: Composite: Draws a white line from (460, 38) to (432, 212) then Renders a yellow disk with center (93, 152) and radius 53 then Sets a single yellow pixel at (359, 215).
; PLAN: r0=460(x1), r1=38(y1), r2=432(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=152(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=359(x), r11=215(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 460
LDI r1, 38
LDI r2, 432
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 152
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 359
LDI r11, 215
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
