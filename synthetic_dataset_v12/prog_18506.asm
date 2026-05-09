; DESCRIPTION: Composite: Draws a blue line from (357, 156) to (223, 12) then Draws a magenta circle centered at (457, 76) with radius 36 then Places a blue dot at position (170, 142).
; PLAN: r0=357(x1), r1=156(y1), r2=223(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=76(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=170(x), r11=142(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 357
LDI r1, 156
LDI r2, 223
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 76
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 170
LDI r11, 142
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
