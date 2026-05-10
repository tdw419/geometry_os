; DESCRIPTION: Composite: Places a white dot at position (76, 48) then Places a magenta circle of radius 53 at center (388, 153) then Places a blue line segment connecting (399, 70) to (98, 211).
; PLAN: r0=76(x), r1=48(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=153(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=399(x1), r11=70(y1), r12=98(x2), r13=211(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 48
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 153
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 399
LDI r11, 70
LDI r12, 98
LDI r13, 211
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
