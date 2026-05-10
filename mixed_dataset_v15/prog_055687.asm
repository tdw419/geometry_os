; DESCRIPTION: Composite: Places a magenta 76x110 rectangle at position (277, 54) then Places a black dot at position (391, 177) then Places a purple circle of radius 77 at center (84, 105).
; PLAN: r0=277(x), r1=54(y), r2=76(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=177(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=84(x), r11=105(y), r12=77(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 277
LDI r1, 54
LDI r2, 76
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 177
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 84
LDI r11, 105
LDI r12, 77
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
