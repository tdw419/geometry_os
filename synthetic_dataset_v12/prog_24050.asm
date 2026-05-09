; DESCRIPTION: Composite: Creates a black rectangular region at (363, 58) spanning 110 by 116 pixels then Places a green circle of radius 17 at center (152, 160) then Places a magenta dot at position (121, 105).
; PLAN: r0=363(x), r1=58(y), r2=110(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=160(y), r7=17(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=121(x), r11=105(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 58
LDI r2, 110
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 160
LDI r7, 17
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 121
LDI r11, 105
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
