; DESCRIPTION: Composite: Creates a green circular shape at (286, 140) with radius 22 then Draws a orange line from (455, 26) to (423, 63) then Creates a red rectangular region at (63, 19) spanning 61 by 102 pixels.
; PLAN: r0=286(x), r1=140(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x1), r6=26(y1), r7=423(x2), r8=63(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=63(x), r11=19(y), r12=61(width), r13=102(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 140
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 26
LDI r7, 423
LDI r8, 63
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 19
LDI r12, 61
LDI r13, 102
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
