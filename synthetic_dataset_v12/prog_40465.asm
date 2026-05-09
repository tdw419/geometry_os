; DESCRIPTION: Composite: Sets a single yellow pixel at (476, 75) then Renders a black line between points (245, 51) and (109, 255) then Renders a blue box of size 57x54 starting at (124, 135).
; PLAN: r0=476(x), r1=75(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=245(x1), r6=51(y1), r7=109(x2), r8=255(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=124(x), r11=135(y), r12=57(width), r13=54(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 476
LDI r1, 75
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 245
LDI r6, 51
LDI r7, 109
LDI r8, 255
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 135
LDI r12, 57
LDI r13, 54
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
