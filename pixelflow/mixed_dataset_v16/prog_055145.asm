; DESCRIPTION: Composite: Places a blue 51x105 rectangle at position (283, 86) then Places a white circle of radius 45 at center (335, 107) then Renders a white line between points (359, 251) and (11, 241).
; PLAN: r0=283(x), r1=86(y), r2=51(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x), r6=107(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=359(x1), r11=251(y1), r12=11(x2), r13=241(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 86
LDI r2, 51
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 107
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 359
LDI r11, 251
LDI r12, 11
LDI r13, 241
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
