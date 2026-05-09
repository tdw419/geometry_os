; DESCRIPTION: Composite: Draws a orange line from (176, 235) to (426, 169) then Creates a green rectangular region at (168, 15) spanning 66 by 64 pixels.
; PLAN: r0=176(x1), r1=235(y1), r2=426(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=15(y), r7=66(width), r8=64(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 235
LDI r2, 426
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 15
LDI r7, 66
LDI r8, 64
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
