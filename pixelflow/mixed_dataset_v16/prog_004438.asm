; DESCRIPTION: Composite: Renders a purple disk with center (152, 127) and radius 54 then Creates a white rectangular region at (182, 72) spanning 55 by 45 pixels then Sets a single yellow pixel at (255, 179).
; PLAN: r0=152(x), r1=127(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=72(y), r7=55(width), r8=45(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x), r11=179(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 152
LDI r1, 127
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 72
LDI r7, 55
LDI r8, 45
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 179
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
