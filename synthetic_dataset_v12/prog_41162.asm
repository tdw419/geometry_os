; DESCRIPTION: Composite: Draws a green circle centered at (114, 29) with radius 25 then Places a black line segment connecting (298, 178) to (190, 104) then Renders a magenta box of size 75x95 starting at (357, 21).
; PLAN: r0=114(x), r1=29(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x1), r6=178(y1), r7=190(x2), r8=104(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=21(y), r12=75(width), r13=95(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 29
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 178
LDI r7, 190
LDI r8, 104
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 21
LDI r12, 75
LDI r13, 95
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
