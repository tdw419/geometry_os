; DESCRIPTION: Composite: Creates a green circular shape at (163, 96) with radius 68 then Places a blue dot at position (262, 9) then Renders a green line between points (0, 118) and (451, 252).
; PLAN: r0=163(x), r1=96(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x), r6=9(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=0(x1), r11=118(y1), r12=451(x2), r13=252(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 96
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 9
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 0
LDI r11, 118
LDI r12, 451
LDI r13, 252
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
