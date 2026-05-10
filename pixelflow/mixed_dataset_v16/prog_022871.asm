; DESCRIPTION: Composite: Draws a cyan circle centered at (368, 163) with radius 48 then Draws a yellow rectangle at (354, 84) with width 33 and height 55 then Places a black line segment connecting (418, 97) to (335, 70).
; PLAN: r0=368(x), r1=163(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x), r6=84(y), r7=33(width), r8=55(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x1), r11=97(y1), r12=335(x2), r13=70(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 163
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 84
LDI r7, 33
LDI r8, 55
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 97
LDI r12, 335
LDI r13, 70
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
