; DESCRIPTION: Composite: Draws a yellow line from (408, 111) to (88, 138) then Creates a orange rectangular region at (327, 160) spanning 77 by 38 pixels then Places a magenta dot at position (122, 28).
; PLAN: r0=408(x1), r1=111(y1), r2=88(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=160(y), r7=77(width), r8=38(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x), r11=28(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 111
LDI r2, 88
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 160
LDI r7, 77
LDI r8, 38
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 28
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
