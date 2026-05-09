; DESCRIPTION: Composite: Draws a yellow line from (159, 248) to (46, 41) then Draws a yellow circle centered at (416, 80) with radius 31 then Places a magenta dot at position (469, 255).
; PLAN: r0=159(x1), r1=248(y1), r2=46(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=80(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=469(x), r11=255(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 248
LDI r2, 46
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 80
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 469
LDI r11, 255
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
