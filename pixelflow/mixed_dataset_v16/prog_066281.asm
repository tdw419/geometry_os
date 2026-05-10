; DESCRIPTION: Composite: Draws a white line from (398, 20) to (310, 176) then Places a cyan circle of radius 74 at center (151, 96) then Draws a white rectangle at (200, 145) with width 99 and height 29.
; PLAN: r0=398(x1), r1=20(y1), r2=310(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=96(y), r7=74(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x), r11=145(y), r12=99(width), r13=29(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 20
LDI r2, 310
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 96
LDI r7, 74
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 145
LDI r12, 99
LDI r13, 29
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
