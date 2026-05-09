; DESCRIPTION: Composite: Sets a single white pixel at (318, 17) then Draws a purple circle centered at (418, 190) with radius 48 then Draws a yellow rectangle at (272, 168) with width 59 and height 44.
; PLAN: r0=318(x), r1=17(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=190(y), r7=48(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=272(x), r11=168(y), r12=59(width), r13=44(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 17
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 418
LDI r6, 190
LDI r7, 48
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 272
LDI r11, 168
LDI r12, 59
LDI r13, 44
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
