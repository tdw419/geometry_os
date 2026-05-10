; DESCRIPTION: Composite: Places a black line segment connecting (277, 134) to (273, 235) then Creates a white rectangular region at (115, 26) spanning 19 by 118 pixels.
; PLAN: r0=277(x1), r1=134(y1), r2=273(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=26(y), r7=19(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 134
LDI r2, 273
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 26
LDI r7, 19
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
