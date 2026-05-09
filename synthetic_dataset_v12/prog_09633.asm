; DESCRIPTION: Composite: Places a blue dot at position (167, 222) then Creates a purple circular shape at (67, 192) with radius 43 then Draws a red line from (195, 51) to (159, 85).
; PLAN: r0=167(x), r1=222(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=192(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x1), r11=51(y1), r12=159(x2), r13=85(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 222
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 192
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 51
LDI r12, 159
LDI r13, 85
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
