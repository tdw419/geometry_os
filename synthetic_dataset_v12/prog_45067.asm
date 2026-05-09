; DESCRIPTION: Composite: Places a red line segment connecting (285, 161) to (367, 24) then Sets a single green pixel at (467, 186) then Draws a blue rectangle at (246, 56) with width 104 and height 92.
; PLAN: r0=285(x1), r1=161(y1), r2=367(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=186(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=246(x), r11=56(y), r12=104(width), r13=92(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 161
LDI r2, 367
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 186
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 246
LDI r11, 56
LDI r12, 104
LDI r13, 92
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
