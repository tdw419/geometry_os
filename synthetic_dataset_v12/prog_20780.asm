; DESCRIPTION: Composite: Sets a single red pixel at (18, 5) then Places a green line segment connecting (367, 156) to (416, 105) then Creates a green rectangular region at (113, 136) spanning 81 by 46 pixels.
; PLAN: r0=18(x), r1=5(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=367(x1), r6=156(y1), r7=416(x2), r8=105(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=113(x), r11=136(y), r12=81(width), r13=46(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 18
LDI r1, 5
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 367
LDI r6, 156
LDI r7, 416
LDI r8, 105
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 136
LDI r12, 81
LDI r13, 46
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
