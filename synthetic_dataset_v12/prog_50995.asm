; DESCRIPTION: Composite: Places a red line segment connecting (433, 125) to (215, 138) then Sets a single yellow pixel at (302, 71) then Places a purple 105x70 rectangle at position (191, 131).
; PLAN: r0=433(x1), r1=125(y1), r2=215(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=71(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=191(x), r11=131(y), r12=105(width), r13=70(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 125
LDI r2, 215
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 71
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 191
LDI r11, 131
LDI r12, 105
LDI r13, 70
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
