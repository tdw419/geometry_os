; DESCRIPTION: Composite: Places a orange circle of radius 22 at center (325, 169) then Draws a blue rectangle at (207, 98) with width 51 and height 54 then Renders a magenta line between points (391, 129) and (121, 52).
; PLAN: r0=325(x), r1=169(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=98(y), r7=51(width), r8=54(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=391(x1), r11=129(y1), r12=121(x2), r13=52(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 169
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 98
LDI r7, 51
LDI r8, 54
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 129
LDI r12, 121
LDI r13, 52
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
