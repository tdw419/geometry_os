; DESCRIPTION: Composite: Renders a magenta line between points (218, 25) and (33, 204) then Places a orange circle of radius 68 at center (168, 134) then Draws a black rectangle at (266, 35) with width 104 and height 56.
; PLAN: r0=218(x1), r1=25(y1), r2=33(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=134(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=266(x), r11=35(y), r12=104(width), r13=56(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 25
LDI r2, 33
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 134
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 266
LDI r11, 35
LDI r12, 104
LDI r13, 56
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
