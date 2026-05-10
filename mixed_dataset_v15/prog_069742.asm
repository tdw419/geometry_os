; DESCRIPTION: Composite: Places a green line segment connecting (345, 219) to (35, 87) then Creates a yellow circular shape at (379, 73) with radius 51 then Draws a white rectangle at (259, 77) with width 103 and height 48.
; PLAN: r0=345(x1), r1=219(y1), r2=35(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=73(y), r7=51(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=259(x), r11=77(y), r12=103(width), r13=48(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 219
LDI r2, 35
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 73
LDI r7, 51
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 259
LDI r11, 77
LDI r12, 103
LDI r13, 48
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
