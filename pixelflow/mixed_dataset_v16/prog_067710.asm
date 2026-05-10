; DESCRIPTION: Composite: Sets a single red pixel at (371, 76) then Draws a purple circle centered at (118, 84) with radius 44 then Renders a green line between points (473, 107) and (397, 217).
; PLAN: r0=371(x), r1=76(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=84(y), r7=44(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=473(x1), r11=107(y1), r12=397(x2), r13=217(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 76
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 118
LDI r6, 84
LDI r7, 44
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 473
LDI r11, 107
LDI r12, 397
LDI r13, 217
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
