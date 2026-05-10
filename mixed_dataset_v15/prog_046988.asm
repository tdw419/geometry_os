; DESCRIPTION: Composite: Places a yellow circle of radius 51 at center (379, 117) then Places a magenta line segment connecting (440, 250) to (330, 133) then Places a white dot at position (139, 178).
; PLAN: r0=379(x), r1=117(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=440(x1), r6=250(y1), r7=330(x2), r8=133(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=178(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 379
LDI r1, 117
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 440
LDI r6, 250
LDI r7, 330
LDI r8, 133
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 178
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
