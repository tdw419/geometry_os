; DESCRIPTION: Composite: Draws a magenta rectangle at (145, 83) with width 25 and height 108 then Places a orange line segment connecting (78, 63) to (138, 194) then Places a black dot at position (226, 94).
; PLAN: r0=145(x), r1=83(y), r2=25(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x1), r6=63(y1), r7=138(x2), r8=194(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=226(x), r11=94(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 145
LDI r1, 83
LDI r2, 25
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 63
LDI r7, 138
LDI r8, 194
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 94
LDI r12, 0x000000
PSET r10, r11, r12
HALT
