; DESCRIPTION: Composite: Sets a single orange pixel at (134, 252) then Creates a black rectangular region at (144, 170) spanning 71 by 36 pixels then Renders a green line between points (113, 79) and (469, 214).
; PLAN: r0=134(x), r1=252(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=170(y), r7=71(width), r8=36(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=113(x1), r11=79(y1), r12=469(x2), r13=214(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 252
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 144
LDI r6, 170
LDI r7, 71
LDI r8, 36
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 79
LDI r12, 469
LDI r13, 214
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
