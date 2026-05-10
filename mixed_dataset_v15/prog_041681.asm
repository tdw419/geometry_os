; DESCRIPTION: Composite: Creates a white rectangular region at (180, 138) spanning 55 by 57 pixels then Sets a single green pixel at (145, 86) then Places a purple line segment connecting (2, 97) to (178, 4).
; PLAN: r0=180(x), r1=138(y), r2=55(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=86(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=2(x1), r11=97(y1), r12=178(x2), r13=4(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 180
LDI r1, 138
LDI r2, 55
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 86
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 2
LDI r11, 97
LDI r12, 178
LDI r13, 4
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
