; DESCRIPTION: Composite: Renders a blue disk with center (232, 122) and radius 51 then Sets a single purple pixel at (388, 59) then Creates a black rectangular region at (286, 122) spanning 120 by 60 pixels.
; PLAN: r0=232(x), r1=122(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=388(x), r6=59(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=122(y), r12=120(width), r13=60(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 122
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 388
LDI r6, 59
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 286
LDI r11, 122
LDI r12, 120
LDI r13, 60
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
