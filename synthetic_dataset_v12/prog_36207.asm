; DESCRIPTION: Composite: Draws a magenta line from (509, 167) to (148, 62) then Creates a yellow circular shape at (70, 178) with radius 37 then Places a yellow dot at position (71, 240).
; PLAN: r0=509(x1), r1=167(y1), r2=148(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=178(y), r7=37(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=71(x), r11=240(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 509
LDI r1, 167
LDI r2, 148
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 178
LDI r7, 37
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 71
LDI r11, 240
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
