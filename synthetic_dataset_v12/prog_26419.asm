; DESCRIPTION: Composite: Creates a yellow rectangular region at (273, 152) spanning 26 by 50 pixels then Sets a single purple pixel at (58, 114) then Draws a yellow line from (129, 35) to (238, 174).
; PLAN: r0=273(x), r1=152(y), r2=26(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=114(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=129(x1), r11=35(y1), r12=238(x2), r13=174(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 152
LDI r2, 26
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 114
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 129
LDI r11, 35
LDI r12, 238
LDI r13, 174
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
