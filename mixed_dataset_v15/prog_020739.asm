; DESCRIPTION: Composite: Sets a single yellow pixel at (211, 165) then Draws a blue line from (85, 62) to (96, 179) then Places a magenta circle of radius 54 at center (77, 60).
; PLAN: r0=211(x), r1=165(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=85(x1), r6=62(y1), r7=96(x2), r8=179(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=60(y), r12=54(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 165
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 85
LDI r6, 62
LDI r7, 96
LDI r8, 179
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 60
LDI r12, 54
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
