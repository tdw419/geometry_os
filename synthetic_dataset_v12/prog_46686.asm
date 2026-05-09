; DESCRIPTION: Composite: Draws a cyan circle centered at (395, 103) with radius 17 then Renders a red line between points (294, 8) and (441, 101) then Creates a yellow rectangular region at (338, 144) spanning 22 by 29 pixels.
; PLAN: r0=395(x), r1=103(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x1), r6=8(y1), r7=441(x2), r8=101(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=338(x), r11=144(y), r12=22(width), r13=29(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 103
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 8
LDI r7, 441
LDI r8, 101
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 144
LDI r12, 22
LDI r13, 29
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
