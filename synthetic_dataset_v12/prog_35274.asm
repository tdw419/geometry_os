; DESCRIPTION: Composite: Draws a blue circle centered at (241, 120) with radius 59 then Renders a orange line between points (269, 165) and (102, 26) then Places a green 57x33 rectangle at position (310, 20).
; PLAN: r0=241(x), r1=120(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x1), r6=165(y1), r7=102(x2), r8=26(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=20(y), r12=57(width), r13=33(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 120
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 165
LDI r7, 102
LDI r8, 26
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 20
LDI r12, 57
LDI r13, 33
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
