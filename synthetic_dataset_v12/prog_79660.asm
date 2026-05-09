; DESCRIPTION: Composite: Places a blue dot at position (15, 231) then Renders a magenta line between points (308, 93) and (69, 29) then Creates a blue circular shape at (140, 220) with radius 22.
; PLAN: r0=15(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=308(x1), r6=93(y1), r7=69(x2), r8=29(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=140(x), r11=220(y), r12=22(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 15
LDI r1, 231
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 308
LDI r6, 93
LDI r7, 69
LDI r8, 29
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 220
LDI r12, 22
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
