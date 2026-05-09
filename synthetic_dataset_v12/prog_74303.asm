; DESCRIPTION: Composite: Renders a blue line between points (318, 89) and (70, 0) then Draws a red circle centered at (462, 113) with radius 10 then Renders a magenta box of size 48x98 starting at (419, 137).
; PLAN: r0=318(x1), r1=89(y1), r2=70(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=462(x), r6=113(y), r7=10(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=419(x), r11=137(y), r12=48(width), r13=98(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 89
LDI r2, 70
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 113
LDI r7, 10
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 419
LDI r11, 137
LDI r12, 48
LDI r13, 98
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
