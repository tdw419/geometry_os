; DESCRIPTION: Composite: Draws a purple circle centered at (357, 137) with radius 58 then Sets a single red pixel at (369, 210) then Renders a purple box of size 96x10 starting at (358, 59).
; PLAN: r0=357(x), r1=137(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=210(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=358(x), r11=59(y), r12=96(width), r13=10(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 137
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 210
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 358
LDI r11, 59
LDI r12, 96
LDI r13, 10
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
