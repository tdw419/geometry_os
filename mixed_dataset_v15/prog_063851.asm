; DESCRIPTION: Composite: Draws a black circle centered at (169, 78) with radius 28 then Sets a single green pixel at (445, 205) then Renders a yellow line between points (481, 148) and (261, 212).
; PLAN: r0=169(x), r1=78(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x), r6=205(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=481(x1), r11=148(y1), r12=261(x2), r13=212(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 78
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 205
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 481
LDI r11, 148
LDI r12, 261
LDI r13, 212
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
