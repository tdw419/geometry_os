; DESCRIPTION: Composite: Sets a single magenta pixel at (313, 76) then Draws a white rectangle at (140, 79) with width 13 and height 25 then Renders a white line between points (495, 198) and (139, 47).
; PLAN: r0=313(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=79(y), r7=13(width), r8=25(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=495(x1), r11=198(y1), r12=139(x2), r13=47(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 76
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 79
LDI r7, 13
LDI r8, 25
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 495
LDI r11, 198
LDI r12, 139
LDI r13, 47
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
