; DESCRIPTION: Composite: Creates a yellow circular shape at (321, 239) with radius 15 then Draws a black line from (235, 152) to (378, 221) then Creates a purple rectangular region at (442, 146) spanning 60 by 24 pixels.
; PLAN: r0=321(x), r1=239(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x1), r6=152(y1), r7=378(x2), r8=221(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=146(y), r12=60(width), r13=24(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 239
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 152
LDI r7, 378
LDI r8, 221
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 146
LDI r12, 60
LDI r13, 24
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
