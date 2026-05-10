; DESCRIPTION: Composite: Places a red circle of radius 63 at center (352, 190) then Places a red line segment connecting (490, 195) to (87, 25) then Creates a green rectangular region at (92, 63) spanning 117 by 80 pixels.
; PLAN: r0=352(x), r1=190(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x1), r6=195(y1), r7=87(x2), r8=25(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=92(x), r11=63(y), r12=117(width), r13=80(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 190
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 195
LDI r7, 87
LDI r8, 25
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 63
LDI r12, 117
LDI r13, 80
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
