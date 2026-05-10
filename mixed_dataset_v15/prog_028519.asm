; DESCRIPTION: Composite: Draws a blue circle centered at (302, 77) with radius 48 then Draws a orange rectangle at (76, 87) with width 53 and height 32 then Draws a magenta line from (184, 247) to (454, 91).
; PLAN: r0=302(x), r1=77(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x), r6=87(y), r7=53(width), r8=32(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x1), r11=247(y1), r12=454(x2), r13=91(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 77
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 87
LDI r7, 53
LDI r8, 32
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 247
LDI r12, 454
LDI r13, 91
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
