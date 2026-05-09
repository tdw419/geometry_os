; DESCRIPTION: Composite: Renders a green disk with center (182, 160) and radius 14 then Draws a purple line from (153, 97) to (441, 47) then Places a black dot at position (117, 137).
; PLAN: r0=182(x), r1=160(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x1), r6=97(y1), r7=441(x2), r8=47(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=117(x), r11=137(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 182
LDI r1, 160
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 97
LDI r7, 441
LDI r8, 47
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 137
LDI r12, 0x000000
PSET r10, r11, r12
HALT
