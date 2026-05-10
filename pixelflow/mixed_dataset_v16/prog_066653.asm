; DESCRIPTION: Composite: Places a yellow line segment connecting (305, 144) to (68, 234) then Sets a single green pixel at (141, 150) then Places a black circle of radius 16 at center (275, 27).
; PLAN: r0=305(x1), r1=144(y1), r2=68(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=150(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=275(x), r11=27(y), r12=16(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 305
LDI r1, 144
LDI r2, 68
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 150
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 275
LDI r11, 27
LDI r12, 16
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
