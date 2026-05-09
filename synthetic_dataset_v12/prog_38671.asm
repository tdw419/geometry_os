; DESCRIPTION: Composite: Sets a single orange pixel at (510, 29) then Draws a white line from (192, 222) to (143, 254) then Renders a white disk with center (436, 167) and radius 65.
; PLAN: r0=510(x), r1=29(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=192(x1), r6=222(y1), r7=143(x2), r8=254(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=436(x), r11=167(y), r12=65(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 510
LDI r1, 29
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 192
LDI r6, 222
LDI r7, 143
LDI r8, 254
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 167
LDI r12, 65
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
