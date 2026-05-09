; DESCRIPTION: Composite: Places a cyan line segment connecting (255, 97) to (169, 214) then Creates a red circular shape at (378, 63) with radius 60 then Creates a green rectangular region at (17, 30) spanning 57 by 97 pixels.
; PLAN: r0=255(x1), r1=97(y1), r2=169(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=63(y), r7=60(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=17(x), r11=30(y), r12=57(width), r13=97(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 97
LDI r2, 169
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 63
LDI r7, 60
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 17
LDI r11, 30
LDI r12, 57
LDI r13, 97
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
