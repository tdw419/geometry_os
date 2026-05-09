; DESCRIPTION: Composite: Creates a yellow circular shape at (383, 101) with radius 60 then Sets a single white pixel at (152, 73) then Places a black line segment connecting (491, 124) to (144, 124).
; PLAN: r0=383(x), r1=101(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x), r6=73(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=491(x1), r11=124(y1), r12=144(x2), r13=124(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 101
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 73
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 491
LDI r11, 124
LDI r12, 144
LDI r13, 124
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
