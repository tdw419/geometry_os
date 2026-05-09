; DESCRIPTION: Composite: Places a red 31x71 rectangle at position (184, 29) then Places a blue line segment connecting (494, 108) to (253, 237) then Renders a black disk with center (293, 123) and radius 14.
; PLAN: r0=184(x), r1=29(y), r2=31(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x1), r6=108(y1), r7=253(x2), r8=237(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=123(y), r12=14(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 184
LDI r1, 29
LDI r2, 31
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 108
LDI r7, 253
LDI r8, 237
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 123
LDI r12, 14
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
