; DESCRIPTION: Composite: Renders a yellow disk with center (353, 140) and radius 39 then Draws a orange line from (478, 95) to (148, 226) then Places a purple dot at position (479, 155).
; PLAN: r0=353(x), r1=140(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x1), r6=95(y1), r7=148(x2), r8=226(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=479(x), r11=155(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 353
LDI r1, 140
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 95
LDI r7, 148
LDI r8, 226
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 155
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
