; DESCRIPTION: Composite: Draws a magenta circle centered at (190, 131) with radius 24 then Draws a orange rectangle at (230, 79) with width 57 and height 104 then Renders a white line between points (98, 99) and (141, 187).
; PLAN: r0=190(x), r1=131(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x), r6=79(y), r7=57(width), r8=104(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=98(x1), r11=99(y1), r12=141(x2), r13=187(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 131
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 79
LDI r7, 57
LDI r8, 104
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 99
LDI r12, 141
LDI r13, 187
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
