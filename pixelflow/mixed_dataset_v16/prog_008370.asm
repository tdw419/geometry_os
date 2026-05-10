; DESCRIPTION: Composite: Renders a orange line between points (125, 15) and (228, 129) then Draws a red circle centered at (61, 57) with radius 22 then Creates a green rectangular region at (158, 30) spanning 87 by 57 pixels.
; PLAN: r0=125(x1), r1=15(y1), r2=228(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=57(y), r7=22(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=158(x), r11=30(y), r12=87(width), r13=57(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 15
LDI r2, 228
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 57
LDI r7, 22
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 158
LDI r11, 30
LDI r12, 87
LDI r13, 57
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
