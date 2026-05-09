; DESCRIPTION: Composite: Draws a blue rectangle at (269, 109) with width 81 and height 82 then Sets a single purple pixel at (206, 217) then Draws a black circle centered at (321, 211) with radius 44.
; PLAN: r0=269(x), r1=109(y), r2=81(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=217(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=321(x), r11=211(y), r12=44(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 269
LDI r1, 109
LDI r2, 81
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 217
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 321
LDI r11, 211
LDI r12, 44
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
