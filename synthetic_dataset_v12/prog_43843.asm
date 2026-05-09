; DESCRIPTION: Composite: Places a blue 66x109 rectangle at position (155, 135) then Draws a magenta line from (18, 107) to (461, 247) then Places a black dot at position (117, 20).
; PLAN: r0=155(x), r1=135(y), r2=66(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x1), r6=107(y1), r7=461(x2), r8=247(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=117(x), r11=20(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 135
LDI r2, 66
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 107
LDI r7, 461
LDI r8, 247
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 20
LDI r12, 0x000000
PSET r10, r11, r12
HALT
