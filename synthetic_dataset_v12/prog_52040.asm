; DESCRIPTION: Composite: Draws a magenta circle centered at (389, 84) with radius 70 then Places a blue dot at position (149, 131) then Places a green line segment connecting (396, 216) to (410, 246).
; PLAN: r0=389(x), r1=84(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x), r6=131(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=396(x1), r11=216(y1), r12=410(x2), r13=246(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 84
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 131
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 396
LDI r11, 216
LDI r12, 410
LDI r13, 246
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
