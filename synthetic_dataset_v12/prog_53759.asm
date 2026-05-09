; DESCRIPTION: Composite: Creates a red circular shape at (111, 75) with radius 57 then Places a orange line segment connecting (401, 115) to (414, 218) then Draws a green rectangle at (313, 114) with width 63 and height 101.
; PLAN: r0=111(x), r1=75(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x1), r6=115(y1), r7=414(x2), r8=218(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=313(x), r11=114(y), r12=63(width), r13=101(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 75
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 115
LDI r7, 414
LDI r8, 218
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 114
LDI r12, 63
LDI r13, 101
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
