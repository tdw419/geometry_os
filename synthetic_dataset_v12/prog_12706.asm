; DESCRIPTION: Composite: Sets a single green pixel at (186, 218) then Renders a yellow line between points (327, 232) and (112, 172) then Draws a white circle centered at (384, 55) with radius 47.
; PLAN: r0=186(x), r1=218(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=327(x1), r6=232(y1), r7=112(x2), r8=172(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=384(x), r11=55(y), r12=47(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 186
LDI r1, 218
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 327
LDI r6, 232
LDI r7, 112
LDI r8, 172
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 55
LDI r12, 47
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
