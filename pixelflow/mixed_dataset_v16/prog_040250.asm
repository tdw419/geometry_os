; DESCRIPTION: Composite: Creates a yellow circular shape at (112, 142) with radius 53 then Sets a single black pixel at (71, 30) then Renders a yellow box of size 67x73 starting at (430, 11).
; PLAN: r0=112(x), r1=142(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=30(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=430(x), r11=11(y), r12=67(width), r13=73(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 142
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 30
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 430
LDI r11, 11
LDI r12, 67
LDI r13, 73
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
