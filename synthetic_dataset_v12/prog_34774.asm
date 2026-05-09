; DESCRIPTION: Composite: Sets a single magenta pixel at (334, 48) then Draws a white line from (392, 206) to (113, 104) then Renders a yellow disk with center (136, 148) and radius 73.
; PLAN: r0=334(x), r1=48(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=392(x1), r6=206(y1), r7=113(x2), r8=104(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=136(x), r11=148(y), r12=73(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 48
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 392
LDI r6, 206
LDI r7, 113
LDI r8, 104
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 148
LDI r12, 73
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
