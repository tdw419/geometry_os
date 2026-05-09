; DESCRIPTION: Composite: Places a black 118x21 rectangle at position (60, 112) then Creates a blue circular shape at (303, 200) with radius 33 then Renders a orange line between points (284, 77) and (426, 3).
; PLAN: r0=60(x), r1=112(y), r2=118(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=200(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x1), r11=77(y1), r12=426(x2), r13=3(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 112
LDI r2, 118
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 200
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 77
LDI r12, 426
LDI r13, 3
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
