; DESCRIPTION: Composite: Draws a green circle centered at (321, 35) with radius 17 then Renders a blue box of size 31x57 starting at (417, 118) then Sets a single green pixel at (253, 198).
; PLAN: r0=321(x), r1=35(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=417(x), r6=118(y), r7=31(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x), r11=198(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 321
LDI r1, 35
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 417
LDI r6, 118
LDI r7, 31
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 198
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
