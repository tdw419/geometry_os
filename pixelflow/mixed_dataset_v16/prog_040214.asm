; DESCRIPTION: Composite: Sets a single blue pixel at (262, 72) then Draws a yellow circle centered at (274, 145) with radius 44 then Renders a blue box of size 65x13 starting at (134, 7).
; PLAN: r0=262(x), r1=72(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=145(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=134(x), r11=7(y), r12=65(width), r13=13(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 72
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 274
LDI r6, 145
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 134
LDI r11, 7
LDI r12, 65
LDI r13, 13
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
