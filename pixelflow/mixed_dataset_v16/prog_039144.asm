; DESCRIPTION: Composite: Draws a red line from (230, 201) to (450, 212) then Draws a yellow circle centered at (197, 68) with radius 62 then Sets a single green pixel at (445, 211).
; PLAN: r0=230(x1), r1=201(y1), r2=450(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=68(y), r7=62(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=445(x), r11=211(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 230
LDI r1, 201
LDI r2, 450
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 68
LDI r7, 62
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 445
LDI r11, 211
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
