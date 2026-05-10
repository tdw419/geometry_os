; DESCRIPTION: Composite: Draws a red circle centered at (279, 118) with radius 37 then Draws a red line from (339, 127) to (46, 211) then Sets a single green pixel at (448, 56).
; PLAN: r0=279(x), r1=118(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=339(x1), r6=127(y1), r7=46(x2), r8=211(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=448(x), r11=56(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 279
LDI r1, 118
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 339
LDI r6, 127
LDI r7, 46
LDI r8, 211
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 56
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
