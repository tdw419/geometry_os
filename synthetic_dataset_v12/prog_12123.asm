; DESCRIPTION: Composite: Draws a white circle centered at (88, 149) with radius 63 then Renders a white line between points (480, 154) and (360, 34) then Draws a white rectangle at (280, 122) with width 51 and height 92.
; PLAN: r0=88(x), r1=149(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=480(x1), r6=154(y1), r7=360(x2), r8=34(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=122(y), r12=51(width), r13=92(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 149
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 480
LDI r6, 154
LDI r7, 360
LDI r8, 34
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 122
LDI r12, 51
LDI r13, 92
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
