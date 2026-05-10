; DESCRIPTION: Composite: Draws a magenta line from (234, 126) to (129, 48) then Creates a green rectangular region at (84, 83) spanning 95 by 93 pixels then Places a blue dot at position (63, 100).
; PLAN: r0=234(x1), r1=126(y1), r2=129(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=83(y), r7=95(width), r8=93(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=63(x), r11=100(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 234
LDI r1, 126
LDI r2, 129
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 83
LDI r7, 95
LDI r8, 93
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 100
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
