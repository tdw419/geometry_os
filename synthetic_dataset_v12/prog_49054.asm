; DESCRIPTION: Composite: Creates a white circular shape at (421, 227) with radius 23 then Sets a single magenta pixel at (287, 225) then Places a white line segment connecting (454, 225) to (36, 125).
; PLAN: r0=421(x), r1=227(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x), r6=225(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=454(x1), r11=225(y1), r12=36(x2), r13=125(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 227
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 225
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 454
LDI r11, 225
LDI r12, 36
LDI r13, 125
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
