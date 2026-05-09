; DESCRIPTION: Composite: Renders a magenta line between points (99, 199) and (495, 29) then Creates a white rectangular region at (42, 127) spanning 35 by 56 pixels then Places a green dot at position (41, 91).
; PLAN: r0=99(x1), r1=199(y1), r2=495(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=127(y), r7=35(width), r8=56(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=41(x), r11=91(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 99
LDI r1, 199
LDI r2, 495
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 127
LDI r7, 35
LDI r8, 56
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 41
LDI r11, 91
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
