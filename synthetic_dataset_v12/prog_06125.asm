; DESCRIPTION: Composite: Places a green dot at position (216, 20) then Renders a cyan line between points (121, 159) and (330, 118) then Creates a orange circular shape at (126, 183) with radius 57.
; PLAN: r0=216(x), r1=20(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=121(x1), r6=159(y1), r7=330(x2), r8=118(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=126(x), r11=183(y), r12=57(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 216
LDI r1, 20
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 121
LDI r6, 159
LDI r7, 330
LDI r8, 118
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 183
LDI r12, 57
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
