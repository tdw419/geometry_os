; DESCRIPTION: Composite: Draws a white line from (235, 186) to (191, 240) then Draws a green rectangle at (3, 102) with width 55 and height 76.
; PLAN: r0=235(x1), r1=186(y1), r2=191(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=3(x), r6=102(y), r7=55(width), r8=76(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 186
LDI r2, 191
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 102
LDI r7, 55
LDI r8, 76
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
