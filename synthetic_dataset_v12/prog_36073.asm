; DESCRIPTION: Composite: Draws a purple line from (306, 69) to (221, 227) then Places a red 89x47 rectangle at position (388, 130) then Sets a single yellow pixel at (323, 208).
; PLAN: r0=306(x1), r1=69(y1), r2=221(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=130(y), r7=89(width), r8=47(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=323(x), r11=208(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 306
LDI r1, 69
LDI r2, 221
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 130
LDI r7, 89
LDI r8, 47
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 208
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
