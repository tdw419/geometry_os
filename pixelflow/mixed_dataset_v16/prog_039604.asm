; DESCRIPTION: Composite: Places a red dot at position (207, 192) then Renders a black line between points (146, 120) and (66, 76) then Draws a cyan circle centered at (490, 121) with radius 12.
; PLAN: r0=207(x), r1=192(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=146(x1), r6=120(y1), r7=66(x2), r8=76(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=490(x), r11=121(y), r12=12(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 207
LDI r1, 192
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 146
LDI r6, 120
LDI r7, 66
LDI r8, 76
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 490
LDI r11, 121
LDI r12, 12
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
