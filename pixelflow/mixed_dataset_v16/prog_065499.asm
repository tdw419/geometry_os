; DESCRIPTION: Composite: Renders a purple disk with center (89, 122) and radius 43 then Sets a single green pixel at (54, 139) then Draws a blue rectangle at (289, 121) with width 64 and height 117.
; PLAN: r0=89(x), r1=122(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=139(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=289(x), r11=121(y), r12=64(width), r13=117(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 122
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 139
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 289
LDI r11, 121
LDI r12, 64
LDI r13, 117
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
