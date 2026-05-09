; DESCRIPTION: Composite: Draws a white rectangle at (259, 47) with width 19 and height 56 then Draws a blue circle centered at (304, 81) with radius 35 then Draws a red line from (419, 86) to (479, 184).
; PLAN: r0=259(x), r1=47(y), r2=19(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=81(y), r7=35(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=419(x1), r11=86(y1), r12=479(x2), r13=184(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 47
LDI r2, 19
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 81
LDI r7, 35
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 419
LDI r11, 86
LDI r12, 479
LDI r13, 184
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
