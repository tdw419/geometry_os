; DESCRIPTION: Composite: Creates a yellow rectangular region at (347, 0) spanning 117 by 106 pixels then Places a magenta line segment connecting (235, 206) to (272, 44).
; PLAN: r0=347(x), r1=0(y), r2=117(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x1), r6=206(y1), r7=272(x2), r8=44(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 0
LDI r2, 117
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 206
LDI r7, 272
LDI r8, 44
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
