; DESCRIPTION: Composite: Places a green dot at position (251, 51) then Renders a magenta line between points (369, 117) and (40, 112) then Places a yellow 79x23 rectangle at position (22, 233).
; PLAN: r0=251(x), r1=51(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=369(x1), r6=117(y1), r7=40(x2), r8=112(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=22(x), r11=233(y), r12=79(width), r13=23(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 51
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 369
LDI r6, 117
LDI r7, 40
LDI r8, 112
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 233
LDI r12, 79
LDI r13, 23
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
