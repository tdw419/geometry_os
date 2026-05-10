; DESCRIPTION: Composite: Places a white dot at position (484, 70) then Places a cyan line segment connecting (254, 19) to (53, 100) then Draws a cyan circle centered at (361, 87) with radius 73.
; PLAN: r0=484(x), r1=70(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=254(x1), r6=19(y1), r7=53(x2), r8=100(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=361(x), r11=87(y), r12=73(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 484
LDI r1, 70
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 254
LDI r6, 19
LDI r7, 53
LDI r8, 100
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 361
LDI r11, 87
LDI r12, 73
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
