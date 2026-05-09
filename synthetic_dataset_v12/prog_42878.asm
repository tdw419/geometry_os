; DESCRIPTION: Composite: Creates a red circular shape at (129, 127) with radius 75 then Places a orange line segment connecting (147, 243) to (14, 32) then Draws a white rectangle at (373, 10) with width 107 and height 102.
; PLAN: r0=129(x), r1=127(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x1), r6=243(y1), r7=14(x2), r8=32(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=10(y), r12=107(width), r13=102(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 127
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 243
LDI r7, 14
LDI r8, 32
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 10
LDI r12, 107
LDI r13, 102
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
