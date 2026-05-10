; DESCRIPTION: Composite: Places a blue circle of radius 58 at center (276, 180) then Renders a green line between points (277, 127) and (344, 37) then Sets a single purple pixel at (153, 69).
; PLAN: r0=276(x), r1=180(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=277(x1), r6=127(y1), r7=344(x2), r8=37(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=69(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 276
LDI r1, 180
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 277
LDI r6, 127
LDI r7, 344
LDI r8, 37
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 69
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
