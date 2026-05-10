; DESCRIPTION: Composite: Places a magenta 108x35 rectangle at position (1, 38) then Renders a red line between points (485, 240) and (138, 44) then Places a orange circle of radius 38 at center (188, 39).
; PLAN: r0=1(x), r1=38(y), r2=108(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x1), r6=240(y1), r7=138(x2), r8=44(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=39(y), r12=38(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 1
LDI r1, 38
LDI r2, 108
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 240
LDI r7, 138
LDI r8, 44
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 39
LDI r12, 38
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
