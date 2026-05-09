; DESCRIPTION: Composite: Draws a blue line from (279, 4) to (500, 229) then Creates a cyan circular shape at (411, 72) with radius 11 then Sets a single yellow pixel at (171, 236).
; PLAN: r0=279(x1), r1=4(y1), r2=500(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=72(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x), r11=236(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 279
LDI r1, 4
LDI r2, 500
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 72
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 236
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
