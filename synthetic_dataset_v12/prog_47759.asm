; DESCRIPTION: Composite: Renders a green line between points (434, 227) and (142, 108) then Draws a purple circle centered at (82, 140) with radius 63 then Sets a single yellow pixel at (296, 76).
; PLAN: r0=434(x1), r1=227(y1), r2=142(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=140(y), r7=63(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=296(x), r11=76(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 434
LDI r1, 227
LDI r2, 142
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 140
LDI r7, 63
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 296
LDI r11, 76
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
