; DESCRIPTION: Composite: Renders a yellow line between points (48, 194) and (433, 67) then Sets a single orange pixel at (270, 3) then Places a green circle of radius 36 at center (86, 64).
; PLAN: r0=48(x1), r1=194(y1), r2=433(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=3(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=86(x), r11=64(y), r12=36(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 48
LDI r1, 194
LDI r2, 433
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 3
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 86
LDI r11, 64
LDI r12, 36
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
