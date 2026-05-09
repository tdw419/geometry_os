; DESCRIPTION: Composite: Draws a red line from (418, 65) to (234, 245) then Creates a green rectangular region at (40, 195) spanning 48 by 33 pixels then Places a blue dot at position (198, 122).
; PLAN: r0=418(x1), r1=65(y1), r2=234(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=195(y), r7=48(width), r8=33(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=198(x), r11=122(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 65
LDI r2, 234
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 195
LDI r7, 48
LDI r8, 33
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 122
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
