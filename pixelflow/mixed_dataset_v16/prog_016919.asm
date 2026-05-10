; DESCRIPTION: Composite: Creates a yellow circular shape at (92, 68) with radius 54 then Draws a black line from (293, 211) to (250, 105) then Sets a single purple pixel at (148, 111).
; PLAN: r0=92(x), r1=68(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x1), r6=211(y1), r7=250(x2), r8=105(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=111(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 92
LDI r1, 68
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 211
LDI r7, 250
LDI r8, 105
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 111
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
