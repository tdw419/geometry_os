; DESCRIPTION: Composite: Renders a blue disk with center (112, 162) and radius 69 then Sets a single purple pixel at (147, 142) then Renders a red box of size 91x94 starting at (76, 78).
; PLAN: r0=112(x), r1=162(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=142(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=76(x), r11=78(y), r12=91(width), r13=94(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 162
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 142
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 76
LDI r11, 78
LDI r12, 91
LDI r13, 94
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
