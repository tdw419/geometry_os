; DESCRIPTION: Composite: Draws a yellow line from (411, 231) to (433, 117) then Places a red circle of radius 69 at center (297, 174) then Places a green dot at position (141, 85).
; PLAN: r0=411(x1), r1=231(y1), r2=433(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=174(y), r7=69(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=141(x), r11=85(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 411
LDI r1, 231
LDI r2, 433
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 174
LDI r7, 69
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 141
LDI r11, 85
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
