; DESCRIPTION: Composite: Creates a yellow circular shape at (308, 231) with radius 15 then Places a blue dot at position (311, 144) then Renders a green line between points (130, 40) and (292, 58).
; PLAN: r0=308(x), r1=231(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=144(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=130(x1), r11=40(y1), r12=292(x2), r13=58(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 231
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 144
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 130
LDI r11, 40
LDI r12, 292
LDI r13, 58
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
