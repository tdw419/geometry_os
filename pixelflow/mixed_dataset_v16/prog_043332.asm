; DESCRIPTION: Composite: Draws a yellow line from (449, 255) to (145, 55) then Creates a red rectangular region at (264, 120) spanning 60 by 99 pixels then Places a green circle of radius 67 at center (256, 152).
; PLAN: r0=449(x1), r1=255(y1), r2=145(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=120(y), r7=60(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x), r11=152(y), r12=67(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 449
LDI r1, 255
LDI r2, 145
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 120
LDI r7, 60
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 152
LDI r12, 67
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
