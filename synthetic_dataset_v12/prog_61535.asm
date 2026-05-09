; DESCRIPTION: Composite: Sets a single black pixel at (72, 106) then Draws a red rectangle at (431, 113) with width 50 and height 99 then Draws a blue line from (326, 66) to (97, 248).
; PLAN: r0=72(x), r1=106(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=113(y), r7=50(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=326(x1), r11=66(y1), r12=97(x2), r13=248(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 106
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 431
LDI r6, 113
LDI r7, 50
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 66
LDI r12, 97
LDI r13, 248
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
