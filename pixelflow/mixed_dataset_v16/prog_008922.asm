; DESCRIPTION: Composite: Places a white dot at position (487, 3) then Draws a red line from (62, 145) to (158, 44) then Renders a magenta disk with center (119, 88) and radius 28.
; PLAN: r0=487(x), r1=3(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=62(x1), r6=145(y1), r7=158(x2), r8=44(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=119(x), r11=88(y), r12=28(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 487
LDI r1, 3
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 62
LDI r6, 145
LDI r7, 158
LDI r8, 44
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 88
LDI r12, 28
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
