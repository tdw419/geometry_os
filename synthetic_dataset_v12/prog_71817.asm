; DESCRIPTION: Composite: Sets a single cyan pixel at (110, 72) then Places a cyan line segment connecting (196, 146) to (155, 153) then Creates a blue circular shape at (103, 177) with radius 46.
; PLAN: r0=110(x), r1=72(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=196(x1), r6=146(y1), r7=155(x2), r8=153(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=177(y), r12=46(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 110
LDI r1, 72
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 146
LDI r7, 155
LDI r8, 153
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 177
LDI r12, 46
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
