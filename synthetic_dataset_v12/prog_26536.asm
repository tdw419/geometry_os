; DESCRIPTION: Composite: Renders a orange box of size 22x89 starting at (319, 92) then Places a white line segment connecting (271, 13) to (424, 54) then Draws a yellow circle centered at (165, 99) with radius 50.
; PLAN: r0=319(x), r1=92(y), r2=22(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x1), r6=13(y1), r7=424(x2), r8=54(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=165(x), r11=99(y), r12=50(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 319
LDI r1, 92
LDI r2, 22
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 13
LDI r7, 424
LDI r8, 54
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 99
LDI r12, 50
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
