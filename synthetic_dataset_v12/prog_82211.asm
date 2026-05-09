; DESCRIPTION: Composite: Draws a purple rectangle at (254, 23) with width 99 and height 104 then Places a red circle of radius 23 at center (40, 124) then Draws a cyan line from (348, 30) to (472, 70).
; PLAN: r0=254(x), r1=23(y), r2=99(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x), r6=124(y), r7=23(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=348(x1), r11=30(y1), r12=472(x2), r13=70(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 23
LDI r2, 99
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 124
LDI r7, 23
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 348
LDI r11, 30
LDI r12, 472
LDI r13, 70
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
