; DESCRIPTION: Composite: Places a yellow circle of radius 74 at center (374, 130) then Draws a red rectangle at (132, 73) with width 103 and height 33 then Places a blue line segment connecting (105, 225) to (144, 247).
; PLAN: r0=374(x), r1=130(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=73(y), r7=103(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=105(x1), r11=225(y1), r12=144(x2), r13=247(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 130
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 73
LDI r7, 103
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 225
LDI r12, 144
LDI r13, 247
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
