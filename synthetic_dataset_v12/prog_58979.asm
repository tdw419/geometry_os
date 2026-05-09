; DESCRIPTION: Composite: Places a yellow line segment connecting (155, 181) to (233, 121) then Creates a cyan rectangular region at (100, 81) spanning 14 by 107 pixels then Places a black dot at position (113, 233).
; PLAN: r0=155(x1), r1=181(y1), r2=233(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=81(y), r7=14(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=113(x), r11=233(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 181
LDI r2, 233
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 81
LDI r7, 14
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 233
LDI r12, 0x000000
PSET r10, r11, r12
HALT
