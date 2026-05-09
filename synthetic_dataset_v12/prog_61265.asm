; DESCRIPTION: Composite: Places a white line segment connecting (196, 117) to (0, 207) then Renders a blue disk with center (468, 214) and radius 20 then Places a orange dot at position (136, 227).
; PLAN: r0=196(x1), r1=117(y1), r2=0(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=468(x), r6=214(y), r7=20(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=136(x), r11=227(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 196
LDI r1, 117
LDI r2, 0
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 214
LDI r7, 20
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 136
LDI r11, 227
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
