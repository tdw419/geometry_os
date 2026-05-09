; DESCRIPTION: Composite: Places a blue dot at position (306, 153) then Draws a blue circle centered at (230, 125) with radius 52 then Draws a red line from (500, 95) to (133, 179).
; PLAN: r0=306(x), r1=153(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=125(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=500(x1), r11=95(y1), r12=133(x2), r13=179(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 153
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 125
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 500
LDI r11, 95
LDI r12, 133
LDI r13, 179
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
