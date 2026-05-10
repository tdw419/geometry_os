; DESCRIPTION: Composite: Draws a black line from (104, 96) to (344, 61) then Creates a blue circular shape at (137, 211) with radius 15 then Sets a single white pixel at (242, 138).
; PLAN: r0=104(x1), r1=96(y1), r2=344(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=211(y), r7=15(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=242(x), r11=138(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 104
LDI r1, 96
LDI r2, 344
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 211
LDI r7, 15
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 242
LDI r11, 138
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
