; DESCRIPTION: Composite: Renders a green line between points (206, 188) and (91, 126) then Sets a single yellow pixel at (467, 141) then Places a purple circle of radius 51 at center (213, 93).
; PLAN: r0=206(x1), r1=188(y1), r2=91(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=141(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=213(x), r11=93(y), r12=51(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 206
LDI r1, 188
LDI r2, 91
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 141
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 213
LDI r11, 93
LDI r12, 51
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
