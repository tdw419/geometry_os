; DESCRIPTION: Composite: Places a orange line segment connecting (419, 118) to (271, 144) then Places a yellow 120x74 rectangle at position (235, 153) then Sets a single orange pixel at (252, 212).
; PLAN: r0=419(x1), r1=118(y1), r2=271(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=153(y), r7=120(width), r8=74(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=252(x), r11=212(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 419
LDI r1, 118
LDI r2, 271
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 153
LDI r7, 120
LDI r8, 74
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 212
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
