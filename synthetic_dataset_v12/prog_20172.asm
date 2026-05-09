; DESCRIPTION: Composite: Draws a orange rectangle at (255, 129) with width 89 and height 102 then Draws a magenta circle centered at (381, 55) with radius 34 then Renders a green line between points (36, 36) and (510, 189).
; PLAN: r0=255(x), r1=129(y), r2=89(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=55(y), r7=34(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=36(x1), r11=36(y1), r12=510(x2), r13=189(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 129
LDI r2, 89
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 55
LDI r7, 34
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 36
LDI r11, 36
LDI r12, 510
LDI r13, 189
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
