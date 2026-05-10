; DESCRIPTION: Composite: Places a white line segment connecting (32, 246) to (461, 33) then Places a orange circle of radius 52 at center (62, 130) then Draws a white rectangle at (279, 4) with width 59 and height 92.
; PLAN: r0=32(x1), r1=246(y1), r2=461(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=130(y), r7=52(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x), r11=4(y), r12=59(width), r13=92(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 246
LDI r2, 461
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 130
LDI r7, 52
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 4
LDI r12, 59
LDI r13, 92
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
