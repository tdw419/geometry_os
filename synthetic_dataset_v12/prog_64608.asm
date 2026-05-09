; DESCRIPTION: Composite: Places a magenta line segment connecting (273, 31) to (49, 187) then Places a white dot at position (453, 18) then Places a blue 11x46 rectangle at position (497, 197).
; PLAN: r0=273(x1), r1=31(y1), r2=49(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=18(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=497(x), r11=197(y), r12=11(width), r13=46(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 31
LDI r2, 49
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 18
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 497
LDI r11, 197
LDI r12, 11
LDI r13, 46
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
