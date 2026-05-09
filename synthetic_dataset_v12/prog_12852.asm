; DESCRIPTION: Composite: Draws a blue circle centered at (294, 197) with radius 55 then Places a blue dot at position (303, 185) then Renders a blue line between points (170, 47) and (427, 57).
; PLAN: r0=294(x), r1=197(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x), r6=185(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=170(x1), r11=47(y1), r12=427(x2), r13=57(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 197
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 185
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 170
LDI r11, 47
LDI r12, 427
LDI r13, 57
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
