; DESCRIPTION: Composite: Places a blue line segment connecting (167, 229) to (265, 249) then Places a black dot at position (472, 78) then Places a blue circle of radius 23 at center (317, 152).
; PLAN: r0=167(x1), r1=229(y1), r2=265(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=78(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=317(x), r11=152(y), r12=23(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 167
LDI r1, 229
LDI r2, 265
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 78
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 317
LDI r11, 152
LDI r12, 23
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
