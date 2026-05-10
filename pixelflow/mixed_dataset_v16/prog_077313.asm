; DESCRIPTION: Composite: Renders a blue disk with center (100, 95) and radius 59 then Sets a single orange pixel at (350, 57) then Renders a black line between points (479, 140) and (491, 28).
; PLAN: r0=100(x), r1=95(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=57(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=479(x1), r11=140(y1), r12=491(x2), r13=28(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 95
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 57
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 479
LDI r11, 140
LDI r12, 491
LDI r13, 28
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
