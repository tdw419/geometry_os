; DESCRIPTION: Composite: Renders a yellow line between points (502, 109) and (340, 54) then Creates a white rectangular region at (90, 5) spanning 51 by 35 pixels then Renders a magenta disk with center (302, 85) and radius 35.
; PLAN: r0=502(x1), r1=109(y1), r2=340(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=5(y), r7=51(width), r8=35(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=302(x), r11=85(y), r12=35(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 502
LDI r1, 109
LDI r2, 340
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 5
LDI r7, 51
LDI r8, 35
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 85
LDI r12, 35
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
