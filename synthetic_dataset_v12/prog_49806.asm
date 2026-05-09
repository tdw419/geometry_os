; DESCRIPTION: Composite: Renders a green disk with center (232, 105) and radius 67 then Sets a single magenta pixel at (57, 70) then Places a green line segment connecting (263, 40) to (473, 49).
; PLAN: r0=232(x), r1=105(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=70(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=263(x1), r11=40(y1), r12=473(x2), r13=49(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 105
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 70
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 263
LDI r11, 40
LDI r12, 473
LDI r13, 49
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
