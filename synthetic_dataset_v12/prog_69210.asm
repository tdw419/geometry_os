; DESCRIPTION: Composite: Creates a purple circular shape at (301, 131) with radius 54 then Sets a single black pixel at (357, 100) then Draws a purple rectangle at (256, 2) with width 100 and height 21.
; PLAN: r0=301(x), r1=131(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=100(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=256(x), r11=2(y), r12=100(width), r13=21(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 131
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 100
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 256
LDI r11, 2
LDI r12, 100
LDI r13, 21
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
