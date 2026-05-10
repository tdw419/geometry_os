; DESCRIPTION: Composite: Renders a blue line between points (60, 99) and (473, 25) then Creates a green circular shape at (349, 107) with radius 74 then Draws a blue rectangle at (350, 171) with width 84 and height 28.
; PLAN: r0=60(x1), r1=99(y1), r2=473(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=107(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=350(x), r11=171(y), r12=84(width), r13=28(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 99
LDI r2, 473
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 107
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 350
LDI r11, 171
LDI r12, 84
LDI r13, 28
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
