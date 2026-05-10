; DESCRIPTION: Composite: Sets a single white pixel at (351, 209) then Places a white circle of radius 74 at center (359, 120) then Draws a yellow rectangle at (16, 94) with width 110 and height 100.
; PLAN: r0=351(x), r1=209(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=120(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=16(x), r11=94(y), r12=110(width), r13=100(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 209
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 120
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 16
LDI r11, 94
LDI r12, 110
LDI r13, 100
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
