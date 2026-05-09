; DESCRIPTION: Composite: Sets a single black pixel at (116, 161) then Draws a magenta line from (110, 250) to (455, 21) then Draws a cyan rectangle at (170, 189) with width 50 and height 29.
; PLAN: r0=116(x), r1=161(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=110(x1), r6=250(y1), r7=455(x2), r8=21(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=170(x), r11=189(y), r12=50(width), r13=29(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 161
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 110
LDI r6, 250
LDI r7, 455
LDI r8, 21
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 189
LDI r12, 50
LDI r13, 29
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
