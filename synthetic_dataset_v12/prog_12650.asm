; DESCRIPTION: Composite: Draws a blue circle centered at (443, 150) with radius 23 then Sets a single blue pixel at (349, 187) then Places a blue line segment connecting (20, 229) to (262, 0).
; PLAN: r0=443(x), r1=150(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=187(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=20(x1), r11=229(y1), r12=262(x2), r13=0(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 150
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 187
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 20
LDI r11, 229
LDI r12, 262
LDI r13, 0
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
