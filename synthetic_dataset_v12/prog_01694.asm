; DESCRIPTION: Composite: Draws a yellow line from (355, 27) to (493, 21) then Creates a magenta circular shape at (166, 151) with radius 55 then Creates a orange rectangular region at (74, 63) spanning 88 by 115 pixels.
; PLAN: r0=355(x1), r1=27(y1), r2=493(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=151(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=74(x), r11=63(y), r12=88(width), r13=115(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 27
LDI r2, 493
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 151
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 74
LDI r11, 63
LDI r12, 88
LDI r13, 115
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
