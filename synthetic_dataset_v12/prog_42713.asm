; DESCRIPTION: Composite: Draws a green rectangle at (208, 175) with width 14 and height 28 then Draws a magenta line from (142, 120) to (235, 232).
; PLAN: r0=208(x), r1=175(y), r2=14(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x1), r6=120(y1), r7=235(x2), r8=232(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 208
LDI r1, 175
LDI r2, 14
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 120
LDI r7, 235
LDI r8, 232
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
