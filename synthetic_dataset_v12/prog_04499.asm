; DESCRIPTION: Composite: Renders a green disk with center (358, 100) and radius 38 then Sets a single blue pixel at (437, 44) then Renders a blue line between points (213, 125) and (13, 16).
; PLAN: r0=358(x), r1=100(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=44(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=213(x1), r11=125(y1), r12=13(x2), r13=16(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 100
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 44
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 213
LDI r11, 125
LDI r12, 13
LDI r13, 16
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
