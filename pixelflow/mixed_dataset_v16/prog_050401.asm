; DESCRIPTION: Composite: Places a blue dot at position (81, 78) then Renders a blue line between points (345, 141) and (173, 73) then Draws a orange circle centered at (60, 107) with radius 44.
; PLAN: r0=81(x), r1=78(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=345(x1), r6=141(y1), r7=173(x2), r8=73(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=60(x), r11=107(y), r12=44(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 81
LDI r1, 78
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 141
LDI r7, 173
LDI r8, 73
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 107
LDI r12, 44
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
