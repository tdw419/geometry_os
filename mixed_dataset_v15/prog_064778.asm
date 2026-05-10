; DESCRIPTION: Composite: Creates a white rectangular region at (426, 126) spanning 69 by 23 pixels then Sets a single yellow pixel at (92, 70) then Draws a orange line from (283, 91) to (83, 82).
; PLAN: r0=426(x), r1=126(y), r2=69(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=70(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=283(x1), r11=91(y1), r12=83(x2), r13=82(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 126
LDI r2, 69
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 70
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 283
LDI r11, 91
LDI r12, 83
LDI r13, 82
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
