; DESCRIPTION: Composite: Renders a cyan disk with center (232, 90) and radius 47 then Places a white line segment connecting (122, 15) to (414, 19) then Creates a orange rectangular region at (220, 95) spanning 29 by 17 pixels.
; PLAN: r0=232(x), r1=90(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x1), r6=15(y1), r7=414(x2), r8=19(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=220(x), r11=95(y), r12=29(width), r13=17(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 90
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 15
LDI r7, 414
LDI r8, 19
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 95
LDI r12, 29
LDI r13, 17
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
