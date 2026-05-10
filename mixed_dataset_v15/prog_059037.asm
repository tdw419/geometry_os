; DESCRIPTION: Composite: Places a purple circle of radius 54 at center (243, 54) then Sets a single purple pixel at (117, 25) then Places a blue line segment connecting (64, 20) to (347, 36).
; PLAN: r0=243(x), r1=54(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x), r6=25(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=64(x1), r11=20(y1), r12=347(x2), r13=36(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 54
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 25
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 64
LDI r11, 20
LDI r12, 347
LDI r13, 36
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
