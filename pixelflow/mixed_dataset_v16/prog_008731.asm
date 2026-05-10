; DESCRIPTION: Composite: Places a orange circle of radius 76 at center (211, 81) then Places a yellow dot at position (483, 133) then Renders a blue line between points (46, 32) and (443, 221).
; PLAN: r0=211(x), r1=81(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x), r6=133(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=46(x1), r11=32(y1), r12=443(x2), r13=221(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 81
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 133
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 46
LDI r11, 32
LDI r12, 443
LDI r13, 221
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
