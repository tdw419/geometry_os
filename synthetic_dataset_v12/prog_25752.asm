; DESCRIPTION: Composite: Renders a green line between points (441, 159) and (503, 100) then Draws a white circle centered at (127, 192) with radius 36 then Sets a single purple pixel at (11, 227).
; PLAN: r0=441(x1), r1=159(y1), r2=503(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=192(y), r7=36(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x), r11=227(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 441
LDI r1, 159
LDI r2, 503
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 192
LDI r7, 36
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 227
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
