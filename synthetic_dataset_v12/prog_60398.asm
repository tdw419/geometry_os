; DESCRIPTION: Composite: Sets a single white pixel at (114, 28) then Creates a green rectangular region at (240, 77) spanning 84 by 38 pixels then Draws a purple line from (28, 250) to (291, 243).
; PLAN: r0=114(x), r1=28(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=240(x), r6=77(y), r7=84(width), r8=38(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=28(x1), r11=250(y1), r12=291(x2), r13=243(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 28
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 240
LDI r6, 77
LDI r7, 84
LDI r8, 38
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 250
LDI r12, 291
LDI r13, 243
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
