; DESCRIPTION: Composite: Places a white dot at position (287, 27) then Renders a blue disk with center (91, 136) and radius 76 then Places a orange line segment connecting (428, 216) to (420, 225).
; PLAN: r0=287(x), r1=27(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=91(x), r6=136(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=428(x1), r11=216(y1), r12=420(x2), r13=225(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 27
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 91
LDI r6, 136
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 428
LDI r11, 216
LDI r12, 420
LDI r13, 225
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
