; DESCRIPTION: Composite: Places a purple line segment connecting (329, 230) to (406, 35) then Draws a white circle centered at (45, 110) with radius 45 then Draws a red rectangle at (128, 16) with width 23 and height 71.
; PLAN: r0=329(x1), r1=230(y1), r2=406(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=110(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=128(x), r11=16(y), r12=23(width), r13=71(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 230
LDI r2, 406
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 110
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 128
LDI r11, 16
LDI r12, 23
LDI r13, 71
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
