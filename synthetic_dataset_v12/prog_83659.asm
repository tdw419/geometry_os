; DESCRIPTION: Composite: Places a blue circle of radius 38 at center (371, 139) then Draws a yellow line from (277, 37) to (136, 23) then Sets a single purple pixel at (68, 24).
; PLAN: r0=371(x), r1=139(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=277(x1), r6=37(y1), r7=136(x2), r8=23(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=68(x), r11=24(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 139
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 277
LDI r6, 37
LDI r7, 136
LDI r8, 23
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 24
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
