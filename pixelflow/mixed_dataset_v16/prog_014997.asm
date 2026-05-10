; DESCRIPTION: Composite: Draws a yellow line from (388, 230) to (14, 92) then Renders a black disk with center (113, 23) and radius 17 then Sets a single green pixel at (253, 174).
; PLAN: r0=388(x1), r1=230(y1), r2=14(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=23(y), r7=17(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=253(x), r11=174(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 388
LDI r1, 230
LDI r2, 14
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 23
LDI r7, 17
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 253
LDI r11, 174
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
