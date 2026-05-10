; DESCRIPTION: Composite: Places a orange circle of radius 32 at center (283, 137) then Sets a single cyan pixel at (196, 125) then Places a black line segment connecting (62, 66) to (90, 59).
; PLAN: r0=283(x), r1=137(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=196(x), r6=125(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=62(x1), r11=66(y1), r12=90(x2), r13=59(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 137
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 196
LDI r6, 125
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 62
LDI r11, 66
LDI r12, 90
LDI r13, 59
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
