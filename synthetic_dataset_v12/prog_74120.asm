; DESCRIPTION: Composite: Creates a blue rectangular region at (409, 215) spanning 99 by 29 pixels then Sets a single blue pixel at (475, 104) then Draws a cyan line from (356, 38) to (337, 15).
; PLAN: r0=409(x), r1=215(y), r2=99(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=475(x), r6=104(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=356(x1), r11=38(y1), r12=337(x2), r13=15(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 215
LDI r2, 99
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 104
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 356
LDI r11, 38
LDI r12, 337
LDI r13, 15
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
