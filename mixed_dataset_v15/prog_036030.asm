; DESCRIPTION: Composite: Sets a single yellow pixel at (11, 197) then Places a yellow line segment connecting (451, 206) to (422, 1) then Creates a black rectangular region at (206, 52) spanning 46 by 90 pixels.
; PLAN: r0=11(x), r1=197(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=451(x1), r6=206(y1), r7=422(x2), r8=1(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=206(x), r11=52(y), r12=46(width), r13=90(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 197
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 451
LDI r6, 206
LDI r7, 422
LDI r8, 1
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 52
LDI r12, 46
LDI r13, 90
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
