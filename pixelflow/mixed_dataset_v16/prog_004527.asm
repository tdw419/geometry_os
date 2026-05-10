; DESCRIPTION: Composite: Places a magenta dot at position (452, 222) then Creates a magenta circular shape at (124, 51) with radius 41 then Places a black line segment connecting (144, 180) to (376, 175).
; PLAN: r0=452(x), r1=222(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=51(y), r7=41(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=144(x1), r11=180(y1), r12=376(x2), r13=175(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 222
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 124
LDI r6, 51
LDI r7, 41
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 144
LDI r11, 180
LDI r12, 376
LDI r13, 175
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
