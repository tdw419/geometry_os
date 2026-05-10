; DESCRIPTION: Composite: Draws a purple line from (26, 252) to (333, 112) then Sets a single red pixel at (479, 3) then Places a green circle of radius 16 at center (448, 32).
; PLAN: r0=26(x1), r1=252(y1), r2=333(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=479(x), r6=3(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=448(x), r11=32(y), r12=16(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 26
LDI r1, 252
LDI r2, 333
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 3
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 448
LDI r11, 32
LDI r12, 16
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
