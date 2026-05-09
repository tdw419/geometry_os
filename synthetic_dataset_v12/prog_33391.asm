; DESCRIPTION: Composite: Sets a single white pixel at (272, 210) then Creates a black rectangular region at (91, 97) spanning 32 by 62 pixels then Places a red line segment connecting (205, 174) to (235, 42).
; PLAN: r0=272(x), r1=210(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=91(x), r6=97(y), r7=32(width), r8=62(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x1), r11=174(y1), r12=235(x2), r13=42(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 210
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 91
LDI r6, 97
LDI r7, 32
LDI r8, 62
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 174
LDI r12, 235
LDI r13, 42
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
