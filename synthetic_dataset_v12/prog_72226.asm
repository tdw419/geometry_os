; DESCRIPTION: Composite: Draws a yellow line from (227, 198) to (510, 75) then Draws a green rectangle at (136, 21) with width 12 and height 90 then Sets a single magenta pixel at (29, 139).
; PLAN: r0=227(x1), r1=198(y1), r2=510(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=136(x), r6=21(y), r7=12(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=29(x), r11=139(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 227
LDI r1, 198
LDI r2, 510
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 21
LDI r7, 12
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 139
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
