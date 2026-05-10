; DESCRIPTION: Composite: Renders a purple disk with center (271, 28) and radius 20 then Places a red dot at position (55, 160) then Renders a red line between points (443, 26) and (390, 99).
; PLAN: r0=271(x), r1=28(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=160(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=443(x1), r11=26(y1), r12=390(x2), r13=99(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 28
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 160
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 443
LDI r11, 26
LDI r12, 390
LDI r13, 99
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
