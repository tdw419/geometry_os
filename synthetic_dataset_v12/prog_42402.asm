; DESCRIPTION: Composite: Creates a white rectangular region at (155, 79) spanning 105 by 61 pixels then Sets a single green pixel at (255, 105) then Renders a green line between points (174, 244) and (49, 247).
; PLAN: r0=155(x), r1=79(y), r2=105(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=105(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=174(x1), r11=244(y1), r12=49(x2), r13=247(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 79
LDI r2, 105
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 105
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 174
LDI r11, 244
LDI r12, 49
LDI r13, 247
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
