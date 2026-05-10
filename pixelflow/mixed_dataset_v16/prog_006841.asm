; DESCRIPTION: Composite: Places a blue circle of radius 14 at center (279, 130) then Draws a yellow rectangle at (44, 31) with width 112 and height 14 then Renders a red line between points (220, 105) and (27, 70).
; PLAN: r0=279(x), r1=130(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=31(y), r7=112(width), r8=14(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=220(x1), r11=105(y1), r12=27(x2), r13=70(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 130
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 31
LDI r7, 112
LDI r8, 14
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 105
LDI r12, 27
LDI r13, 70
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
