; DESCRIPTION: Composite: Places a red line segment connecting (57, 151) to (464, 125) then Sets a single black pixel at (189, 117) then Creates a black rectangular region at (252, 160) spanning 103 by 35 pixels.
; PLAN: r0=57(x1), r1=151(y1), r2=464(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=117(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=252(x), r11=160(y), r12=103(width), r13=35(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 151
LDI r2, 464
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 117
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 252
LDI r11, 160
LDI r12, 103
LDI r13, 35
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
