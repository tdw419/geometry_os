; DESCRIPTION: Composite: Sets a single purple pixel at (33, 25) then Places a blue line segment connecting (345, 9) to (125, 173) then Creates a white circular shape at (119, 74) with radius 51.
; PLAN: r0=33(x), r1=25(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=345(x1), r6=9(y1), r7=125(x2), r8=173(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=119(x), r11=74(y), r12=51(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 33
LDI r1, 25
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 9
LDI r7, 125
LDI r8, 173
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 74
LDI r12, 51
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
