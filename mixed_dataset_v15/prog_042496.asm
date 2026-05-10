; DESCRIPTION: Composite: Creates a green circular shape at (334, 99) with radius 29 then Draws a green rectangle at (53, 151) with width 47 and height 16 then Draws a black line from (386, 141) to (256, 210).
; PLAN: r0=334(x), r1=99(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=151(y), r7=47(width), r8=16(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=386(x1), r11=141(y1), r12=256(x2), r13=210(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 99
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 151
LDI r7, 47
LDI r8, 16
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 141
LDI r12, 256
LDI r13, 210
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
