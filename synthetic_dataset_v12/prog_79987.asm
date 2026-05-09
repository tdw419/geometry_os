; DESCRIPTION: Composite: Places a red circle of radius 55 at center (366, 67) then Draws a black line from (451, 115) to (100, 206) then Places a green dot at position (101, 173).
; PLAN: r0=366(x), r1=67(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x1), r6=115(y1), r7=100(x2), r8=206(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=173(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 366
LDI r1, 67
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 115
LDI r7, 100
LDI r8, 206
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 173
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
