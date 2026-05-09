; DESCRIPTION: Composite: Sets a single yellow pixel at (474, 96) then Renders a blue line between points (43, 124) and (20, 133) then Creates a purple rectangular region at (283, 138) spanning 103 by 71 pixels.
; PLAN: r0=474(x), r1=96(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=43(x1), r6=124(y1), r7=20(x2), r8=133(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=283(x), r11=138(y), r12=103(width), r13=71(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 474
LDI r1, 96
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 43
LDI r6, 124
LDI r7, 20
LDI r8, 133
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 138
LDI r12, 103
LDI r13, 71
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
