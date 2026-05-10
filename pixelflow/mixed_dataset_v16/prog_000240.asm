; DESCRIPTION: Composite: Draws a white circle centered at (428, 33) with radius 29 then Places a green dot at position (58, 25) then Renders a blue line between points (203, 234) and (17, 60).
; PLAN: r0=428(x), r1=33(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x), r6=25(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=203(x1), r11=234(y1), r12=17(x2), r13=60(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 33
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 25
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 203
LDI r11, 234
LDI r12, 17
LDI r13, 60
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
