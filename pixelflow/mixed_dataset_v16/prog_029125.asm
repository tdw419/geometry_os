; DESCRIPTION: Composite: Sets a single purple pixel at (232, 38) then Creates a blue rectangular region at (192, 44) spanning 93 by 55 pixels then Draws a purple line from (354, 142) to (336, 12).
; PLAN: r0=232(x), r1=38(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=44(y), r7=93(width), r8=55(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=354(x1), r11=142(y1), r12=336(x2), r13=12(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 38
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 44
LDI r7, 93
LDI r8, 55
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 142
LDI r12, 336
LDI r13, 12
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
