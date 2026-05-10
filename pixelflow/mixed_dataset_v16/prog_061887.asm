; DESCRIPTION: Composite: Places a black line segment connecting (24, 77) to (376, 89) then Places a magenta dot at position (63, 169) then Renders a green box of size 59x97 starting at (276, 98).
; PLAN: r0=24(x1), r1=77(y1), r2=376(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=169(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=276(x), r11=98(y), r12=59(width), r13=97(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 77
LDI r2, 376
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 169
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 276
LDI r11, 98
LDI r12, 59
LDI r13, 97
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
