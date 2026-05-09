; DESCRIPTION: Composite: Creates a black rectangular region at (230, 194) spanning 47 by 39 pixels then Sets a single magenta pixel at (124, 230) then Draws a blue line from (204, 208) to (418, 105).
; PLAN: r0=230(x), r1=194(y), r2=47(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x), r6=230(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=204(x1), r11=208(y1), r12=418(x2), r13=105(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 194
LDI r2, 47
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 230
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 204
LDI r11, 208
LDI r12, 418
LDI r13, 105
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
