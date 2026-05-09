; DESCRIPTION: Composite: Sets a single blue pixel at (207, 146) then Renders a black line between points (285, 219) and (66, 141) then Draws a purple circle centered at (142, 224) with radius 27.
; PLAN: r0=207(x), r1=146(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=285(x1), r6=219(y1), r7=66(x2), r8=141(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=224(y), r12=27(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 207
LDI r1, 146
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 285
LDI r6, 219
LDI r7, 66
LDI r8, 141
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 224
LDI r12, 27
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
