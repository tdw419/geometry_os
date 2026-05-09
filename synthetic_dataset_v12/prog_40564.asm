; DESCRIPTION: Composite: Renders a green line between points (203, 111) and (208, 163) then Draws a yellow circle centered at (420, 116) with radius 52 then Draws a orange rectangle at (389, 112) with width 39 and height 91.
; PLAN: r0=203(x1), r1=111(y1), r2=208(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=116(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=389(x), r11=112(y), r12=39(width), r13=91(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 111
LDI r2, 208
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 116
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 389
LDI r11, 112
LDI r12, 39
LDI r13, 91
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
