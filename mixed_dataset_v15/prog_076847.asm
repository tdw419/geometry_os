; DESCRIPTION: Composite: Places a blue circle of radius 44 at center (219, 192) then Places a magenta dot at position (159, 22) then Places a yellow line segment connecting (387, 14) to (112, 218).
; PLAN: r0=219(x), r1=192(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=22(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=387(x1), r11=14(y1), r12=112(x2), r13=218(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 219
LDI r1, 192
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 22
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 387
LDI r11, 14
LDI r12, 112
LDI r13, 218
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
