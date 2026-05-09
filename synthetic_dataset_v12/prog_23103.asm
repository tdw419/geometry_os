; DESCRIPTION: Composite: Places a blue line segment connecting (444, 149) to (141, 113) then Creates a white circular shape at (68, 115) with radius 32 then Sets a single green pixel at (85, 153).
; PLAN: r0=444(x1), r1=149(y1), r2=141(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=115(y), r7=32(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=85(x), r11=153(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 444
LDI r1, 149
LDI r2, 141
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 115
LDI r7, 32
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 85
LDI r11, 153
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
