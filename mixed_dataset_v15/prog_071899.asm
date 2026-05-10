; DESCRIPTION: Composite: Places a magenta circle of radius 57 at center (213, 186) then Renders a white line between points (335, 147) and (10, 17) then Places a black dot at position (348, 188).
; PLAN: r0=213(x), r1=186(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x1), r6=147(y1), r7=10(x2), r8=17(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=348(x), r11=188(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 213
LDI r1, 186
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 147
LDI r7, 10
LDI r8, 17
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 188
LDI r12, 0x000000
PSET r10, r11, r12
HALT
