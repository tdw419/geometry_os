; DESCRIPTION: Composite: Creates a black circular shape at (219, 81) with radius 30 then Draws a purple line from (58, 46) to (305, 8) then Places a yellow dot at position (378, 143).
; PLAN: r0=219(x), r1=81(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x1), r6=46(y1), r7=305(x2), r8=8(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=143(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 219
LDI r1, 81
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 46
LDI r7, 305
LDI r8, 8
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 143
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
