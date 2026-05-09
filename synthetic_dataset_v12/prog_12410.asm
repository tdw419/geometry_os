; DESCRIPTION: Composite: Creates a magenta circular shape at (232, 143) with radius 26 then Places a white dot at position (2, 175) then Renders a black line between points (362, 144) and (324, 65).
; PLAN: r0=232(x), r1=143(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x), r6=175(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=362(x1), r11=144(y1), r12=324(x2), r13=65(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 143
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 175
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 362
LDI r11, 144
LDI r12, 324
LDI r13, 65
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
