; DESCRIPTION: Composite: Places a white dot at position (481, 243) then Places a white line segment connecting (163, 179) to (490, 54) then Draws a green circle centered at (217, 177) with radius 66.
; PLAN: r0=481(x), r1=243(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=163(x1), r6=179(y1), r7=490(x2), r8=54(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=217(x), r11=177(y), r12=66(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 481
LDI r1, 243
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 163
LDI r6, 179
LDI r7, 490
LDI r8, 54
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 217
LDI r11, 177
LDI r12, 66
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
