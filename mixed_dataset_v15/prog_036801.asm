; DESCRIPTION: Composite: Renders a white line between points (254, 63) and (386, 116) then Places a red dot at position (431, 75) then Renders a blue disk with center (112, 91) and radius 45.
; PLAN: r0=254(x1), r1=63(y1), r2=386(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=75(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=112(x), r11=91(y), r12=45(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 254
LDI r1, 63
LDI r2, 386
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 75
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 112
LDI r11, 91
LDI r12, 45
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
