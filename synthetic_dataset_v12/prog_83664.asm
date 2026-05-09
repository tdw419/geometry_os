; DESCRIPTION: Composite: Renders a black disk with center (202, 114) and radius 26 then Sets a single yellow pixel at (385, 231) then Renders a blue line between points (281, 65) and (461, 68).
; PLAN: r0=202(x), r1=114(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=231(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=281(x1), r11=65(y1), r12=461(x2), r13=68(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 114
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 231
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 281
LDI r11, 65
LDI r12, 461
LDI r13, 68
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
