; DESCRIPTION: Composite: Draws a yellow line from (160, 244) to (70, 135) then Draws a white circle centered at (164, 85) with radius 80 then Draws a blue rectangle at (342, 75) with width 96 and height 74.
; PLAN: r0=160(x1), r1=244(y1), r2=70(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=85(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=342(x), r11=75(y), r12=96(width), r13=74(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 244
LDI r2, 70
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 85
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 342
LDI r11, 75
LDI r12, 96
LDI r13, 74
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
