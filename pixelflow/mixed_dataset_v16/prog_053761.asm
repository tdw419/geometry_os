; DESCRIPTION: Composite: Sets a single black pixel at (127, 104) then Draws a magenta line from (309, 77) to (462, 217) then Places a yellow 108x51 rectangle at position (248, 186).
; PLAN: r0=127(x), r1=104(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=309(x1), r6=77(y1), r7=462(x2), r8=217(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=248(x), r11=186(y), r12=108(width), r13=51(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 104
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 309
LDI r6, 77
LDI r7, 462
LDI r8, 217
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 186
LDI r12, 108
LDI r13, 51
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
