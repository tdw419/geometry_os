; DESCRIPTION: Composite: Draws a white circle centered at (434, 120) with radius 65 then Renders a yellow line between points (422, 1) and (111, 169) then Draws a orange rectangle at (89, 115) with width 87 and height 103.
; PLAN: r0=434(x), r1=120(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x1), r6=1(y1), r7=111(x2), r8=169(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=89(x), r11=115(y), r12=87(width), r13=103(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 120
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 1
LDI r7, 111
LDI r8, 169
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 115
LDI r12, 87
LDI r13, 103
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
