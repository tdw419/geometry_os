; DESCRIPTION: Composite: Creates a orange circular shape at (129, 147) with radius 60 then Places a orange line segment connecting (11, 190) to (270, 145) then Renders a magenta box of size 98x71 starting at (165, 22).
; PLAN: r0=129(x), r1=147(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x1), r6=190(y1), r7=270(x2), r8=145(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=165(x), r11=22(y), r12=98(width), r13=71(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 147
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 190
LDI r7, 270
LDI r8, 145
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 22
LDI r12, 98
LDI r13, 71
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
