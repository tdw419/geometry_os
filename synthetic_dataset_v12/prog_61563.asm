; DESCRIPTION: Composite: Renders a blue box of size 50x14 starting at (132, 57) then Draws a blue line from (411, 187) to (417, 235) then Sets a single orange pixel at (28, 78).
; PLAN: r0=132(x), r1=57(y), r2=50(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x1), r6=187(y1), r7=417(x2), r8=235(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=28(x), r11=78(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 57
LDI r2, 50
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 187
LDI r7, 417
LDI r8, 235
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 78
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
