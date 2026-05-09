; DESCRIPTION: Composite: Sets a single yellow pixel at (284, 189) then Draws a cyan rectangle at (117, 138) with width 110 and height 51 then Places a orange line segment connecting (134, 170) to (440, 13).
; PLAN: r0=284(x), r1=189(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=138(y), r7=110(width), r8=51(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x1), r11=170(y1), r12=440(x2), r13=13(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 189
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 117
LDI r6, 138
LDI r7, 110
LDI r8, 51
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 170
LDI r12, 440
LDI r13, 13
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
