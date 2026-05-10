; DESCRIPTION: Composite: Draws a red line from (349, 141) to (236, 225) then Places a yellow 92x78 rectangle at position (251, 10) then Sets a single blue pixel at (409, 245).
; PLAN: r0=349(x1), r1=141(y1), r2=236(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=10(y), r7=92(width), r8=78(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=409(x), r11=245(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 349
LDI r1, 141
LDI r2, 236
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 10
LDI r7, 92
LDI r8, 78
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 245
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
