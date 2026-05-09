; DESCRIPTION: Composite: Renders a yellow line between points (99, 236) and (244, 197) then Renders a green disk with center (75, 136) and radius 48 then Sets a single blue pixel at (465, 64).
; PLAN: r0=99(x1), r1=236(y1), r2=244(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=136(y), r7=48(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=465(x), r11=64(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 99
LDI r1, 236
LDI r2, 244
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 136
LDI r7, 48
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 465
LDI r11, 64
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
