; DESCRIPTION: Composite: Places a orange line segment connecting (179, 196) to (96, 247) then Sets a single magenta pixel at (466, 113) then Creates a white circular shape at (187, 60) with radius 57.
; PLAN: r0=179(x1), r1=196(y1), r2=96(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=113(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=187(x), r11=60(y), r12=57(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 179
LDI r1, 196
LDI r2, 96
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 113
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 187
LDI r11, 60
LDI r12, 57
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
