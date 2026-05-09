; DESCRIPTION: Composite: Draws a black line from (258, 70) to (294, 189) then Places a blue dot at position (69, 40) then Places a yellow circle of radius 56 at center (79, 173).
; PLAN: r0=258(x1), r1=70(y1), r2=294(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=40(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=79(x), r11=173(y), r12=56(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 258
LDI r1, 70
LDI r2, 294
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 40
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 79
LDI r11, 173
LDI r12, 56
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
