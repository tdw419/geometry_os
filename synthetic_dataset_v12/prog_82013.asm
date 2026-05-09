; DESCRIPTION: Composite: Creates a black rectangular region at (271, 0) spanning 38 by 96 pixels then Places a black line segment connecting (428, 105) to (345, 231) then Creates a magenta circular shape at (411, 64) with radius 48.
; PLAN: r0=271(x), r1=0(y), r2=38(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=428(x1), r6=105(y1), r7=345(x2), r8=231(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=411(x), r11=64(y), r12=48(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 271
LDI r1, 0
LDI r2, 38
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 105
LDI r7, 345
LDI r8, 231
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 64
LDI r12, 48
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
