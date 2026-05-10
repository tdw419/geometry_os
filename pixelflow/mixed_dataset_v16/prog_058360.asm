; DESCRIPTION: Composite: Renders a orange line between points (392, 116) and (350, 69) then Renders a purple disk with center (354, 169) and radius 69 then Places a blue dot at position (106, 244).
; PLAN: r0=392(x1), r1=116(y1), r2=350(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=169(y), r7=69(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=106(x), r11=244(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 116
LDI r2, 350
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 169
LDI r7, 69
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 106
LDI r11, 244
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
