; DESCRIPTION: Composite: Creates a yellow rectangular region at (303, 218) spanning 75 by 20 pixels then Sets a single blue pixel at (108, 130) then Places a black circle of radius 64 at center (337, 160).
; PLAN: r0=303(x), r1=218(y), r2=75(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=130(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=160(y), r12=64(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 303
LDI r1, 218
LDI r2, 75
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 130
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 337
LDI r11, 160
LDI r12, 64
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
