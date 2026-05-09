; DESCRIPTION: Composite: Places a yellow line segment connecting (338, 236) to (181, 105) then Places a magenta 97x116 rectangle at position (251, 89).
; PLAN: r0=338(x1), r1=236(y1), r2=181(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=89(y), r7=97(width), r8=116(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 236
LDI r2, 181
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 89
LDI r7, 97
LDI r8, 116
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
