; DESCRIPTION: Composite: Places a white line segment connecting (404, 172) to (469, 108) then Places a magenta 59x84 rectangle at position (148, 144) then Sets a single white pixel at (351, 107).
; PLAN: r0=404(x1), r1=172(y1), r2=469(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=144(y), r7=59(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=351(x), r11=107(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 404
LDI r1, 172
LDI r2, 469
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 144
LDI r7, 59
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 107
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
