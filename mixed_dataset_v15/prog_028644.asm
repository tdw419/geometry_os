; DESCRIPTION: Composite: Draws a cyan circle centered at (221, 211) with radius 24 then Draws a purple line from (46, 227) to (339, 147) then Places a red dot at position (54, 85).
; PLAN: r0=221(x), r1=211(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x1), r6=227(y1), r7=339(x2), r8=147(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=54(x), r11=85(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 221
LDI r1, 211
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 227
LDI r7, 339
LDI r8, 147
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 85
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
