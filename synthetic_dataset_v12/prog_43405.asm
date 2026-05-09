; DESCRIPTION: Composite: Renders a yellow disk with center (133, 102) and radius 59 then Sets a single red pixel at (299, 219) then Draws a magenta rectangle at (318, 77) with width 70 and height 83.
; PLAN: r0=133(x), r1=102(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x), r6=219(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=318(x), r11=77(y), r12=70(width), r13=83(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 102
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 219
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 318
LDI r11, 77
LDI r12, 70
LDI r13, 83
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
