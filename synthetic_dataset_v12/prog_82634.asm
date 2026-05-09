; DESCRIPTION: Composite: Sets a single yellow pixel at (145, 50) then Draws a magenta rectangle at (282, 7) with width 44 and height 76 then Draws a orange line from (464, 16) to (408, 46).
; PLAN: r0=145(x), r1=50(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=7(y), r7=44(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=464(x1), r11=16(y1), r12=408(x2), r13=46(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 50
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 282
LDI r6, 7
LDI r7, 44
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 16
LDI r12, 408
LDI r13, 46
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
