; DESCRIPTION: Composite: Draws a purple line from (404, 47) to (151, 209) then Places a green circle of radius 51 at center (146, 198) then Places a orange dot at position (260, 137).
; PLAN: r0=404(x1), r1=47(y1), r2=151(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=198(y), r7=51(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=260(x), r11=137(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 404
LDI r1, 47
LDI r2, 151
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 198
LDI r7, 51
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 260
LDI r11, 137
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
