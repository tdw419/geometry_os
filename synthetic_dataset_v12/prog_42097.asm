; DESCRIPTION: Composite: Draws a yellow circle centered at (279, 202) with radius 25 then Places a white dot at position (283, 84) then Draws a purple rectangle at (422, 225) with width 83 and height 22.
; PLAN: r0=279(x), r1=202(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=84(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=422(x), r11=225(y), r12=83(width), r13=22(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 202
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 84
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 422
LDI r11, 225
LDI r12, 83
LDI r13, 22
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
