; DESCRIPTION: Composite: Renders a white disk with center (240, 149) and radius 59 then Places a white line segment connecting (182, 130) to (233, 118) then Draws a red rectangle at (70, 121) with width 109 and height 88.
; PLAN: r0=240(x), r1=149(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x1), r6=130(y1), r7=233(x2), r8=118(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=70(x), r11=121(y), r12=109(width), r13=88(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 149
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 130
LDI r7, 233
LDI r8, 118
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 121
LDI r12, 109
LDI r13, 88
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
