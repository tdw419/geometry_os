; DESCRIPTION: Composite: Sets a single black pixel at (86, 127) then Creates a yellow circular shape at (459, 202) with radius 37 then Places a blue line segment connecting (22, 246) to (481, 76).
; PLAN: r0=86(x), r1=127(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=459(x), r6=202(y), r7=37(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x1), r11=246(y1), r12=481(x2), r13=76(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 127
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 459
LDI r6, 202
LDI r7, 37
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 246
LDI r12, 481
LDI r13, 76
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
