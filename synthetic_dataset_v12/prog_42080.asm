; DESCRIPTION: Composite: Creates a green rectangular region at (441, 20) spanning 38 by 58 pixels then Renders a magenta line between points (32, 48) and (404, 180) then Draws a purple circle centered at (308, 176) with radius 12.
; PLAN: r0=441(x), r1=20(y), r2=38(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=32(x1), r6=48(y1), r7=404(x2), r8=180(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=176(y), r12=12(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 441
LDI r1, 20
LDI r2, 38
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 48
LDI r7, 404
LDI r8, 180
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 176
LDI r12, 12
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
