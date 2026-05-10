; DESCRIPTION: Composite: Places a white line segment connecting (300, 241) to (92, 104) then Renders a black box of size 83x102 starting at (351, 19) then Renders a magenta disk with center (189, 103) and radius 35.
; PLAN: r0=300(x1), r1=241(y1), r2=92(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=19(y), r7=83(width), r8=102(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=189(x), r11=103(y), r12=35(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 300
LDI r1, 241
LDI r2, 92
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 19
LDI r7, 83
LDI r8, 102
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 103
LDI r12, 35
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
