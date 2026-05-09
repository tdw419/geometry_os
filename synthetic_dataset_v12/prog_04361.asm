; DESCRIPTION: Composite: Sets a single yellow pixel at (504, 179) then Creates a red rectangular region at (475, 58) spanning 13 by 113 pixels then Draws a white line from (83, 224) to (97, 239).
; PLAN: r0=504(x), r1=179(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=475(x), r6=58(y), r7=13(width), r8=113(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=83(x1), r11=224(y1), r12=97(x2), r13=239(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 504
LDI r1, 179
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 475
LDI r6, 58
LDI r7, 13
LDI r8, 113
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 224
LDI r12, 97
LDI r13, 239
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
