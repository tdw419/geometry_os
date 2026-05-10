; DESCRIPTION: Composite: Sets a single white pixel at (297, 212) then Draws a blue line from (201, 199) to (166, 221) then Draws a green circle centered at (161, 111) with radius 25.
; PLAN: r0=297(x), r1=212(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=201(x1), r6=199(y1), r7=166(x2), r8=221(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=111(y), r12=25(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 212
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 201
LDI r6, 199
LDI r7, 166
LDI r8, 221
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 111
LDI r12, 25
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
