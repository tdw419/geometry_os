; DESCRIPTION: Composite: Creates a yellow circular shape at (139, 155) with radius 25 then Renders a magenta line between points (219, 157) and (286, 225) then Sets a single green pixel at (121, 100).
; PLAN: r0=139(x), r1=155(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x1), r6=157(y1), r7=286(x2), r8=225(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=121(x), r11=100(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 155
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 157
LDI r7, 286
LDI r8, 225
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 121
LDI r11, 100
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
