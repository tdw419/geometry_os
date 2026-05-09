; DESCRIPTION: Composite: Places a orange line segment connecting (451, 211) to (237, 255) then Places a yellow dot at position (420, 59) then Places a white circle of radius 66 at center (204, 125).
; PLAN: r0=451(x1), r1=211(y1), r2=237(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=59(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=204(x), r11=125(y), r12=66(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 451
LDI r1, 211
LDI r2, 237
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 59
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 204
LDI r11, 125
LDI r12, 66
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
