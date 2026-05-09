; DESCRIPTION: Composite: Draws a red circle centered at (440, 188) with radius 55 then Renders a blue box of size 107x71 starting at (23, 92) then Renders a cyan line between points (33, 29) and (339, 248).
; PLAN: r0=440(x), r1=188(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x), r6=92(y), r7=107(width), r8=71(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=33(x1), r11=29(y1), r12=339(x2), r13=248(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 188
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 92
LDI r7, 107
LDI r8, 71
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 29
LDI r12, 339
LDI r13, 248
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
