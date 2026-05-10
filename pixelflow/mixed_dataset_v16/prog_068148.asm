; DESCRIPTION: Composite: Draws a blue line from (82, 222) to (461, 245) then Creates a yellow circular shape at (414, 165) with radius 71 then Places a yellow dot at position (80, 96).
; PLAN: r0=82(x1), r1=222(y1), r2=461(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=165(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=80(x), r11=96(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 82
LDI r1, 222
LDI r2, 461
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 165
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 80
LDI r11, 96
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
