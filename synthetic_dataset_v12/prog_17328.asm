; DESCRIPTION: Composite: Draws a yellow circle centered at (82, 74) with radius 70 then Sets a single black pixel at (484, 144) then Renders a yellow line between points (443, 241) and (356, 75).
; PLAN: r0=82(x), r1=74(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x), r6=144(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=443(x1), r11=241(y1), r12=356(x2), r13=75(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 74
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 144
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 443
LDI r11, 241
LDI r12, 356
LDI r13, 75
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
