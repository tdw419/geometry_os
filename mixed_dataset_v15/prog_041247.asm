; DESCRIPTION: Composite: Sets a single black pixel at (340, 235) then Creates a yellow circular shape at (68, 199) with radius 41 then Places a white line segment connecting (412, 67) to (230, 142).
; PLAN: r0=340(x), r1=235(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=199(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=412(x1), r11=67(y1), r12=230(x2), r13=142(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 235
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 68
LDI r6, 199
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 412
LDI r11, 67
LDI r12, 230
LDI r13, 142
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
