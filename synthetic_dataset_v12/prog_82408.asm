; DESCRIPTION: Composite: Places a magenta circle of radius 35 at center (369, 204) then Sets a single blue pixel at (195, 51) then Creates a red rectangular region at (475, 161) spanning 30 by 46 pixels.
; PLAN: r0=369(x), r1=204(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x), r6=51(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=475(x), r11=161(y), r12=30(width), r13=46(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 204
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 51
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 475
LDI r11, 161
LDI r12, 30
LDI r13, 46
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
