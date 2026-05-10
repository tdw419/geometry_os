; DESCRIPTION: Composite: Places a white line segment connecting (121, 175) to (431, 88) then Places a white dot at position (77, 131) then Creates a yellow rectangular region at (224, 1) spanning 65 by 65 pixels.
; PLAN: r0=121(x1), r1=175(y1), r2=431(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=131(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=224(x), r11=1(y), r12=65(width), r13=65(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 175
LDI r2, 431
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 131
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 224
LDI r11, 1
LDI r12, 65
LDI r13, 65
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
