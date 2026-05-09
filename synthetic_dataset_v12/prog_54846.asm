; DESCRIPTION: Composite: Places a black 96x73 rectangle at position (223, 103) then Places a black line segment connecting (472, 254) to (302, 112) then Sets a single white pixel at (216, 88).
; PLAN: r0=223(x), r1=103(y), r2=96(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x1), r6=254(y1), r7=302(x2), r8=112(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=88(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 103
LDI r2, 96
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 254
LDI r7, 302
LDI r8, 112
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 88
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
