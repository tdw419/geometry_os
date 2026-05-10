; DESCRIPTION: Composite: Creates a green rectangular region at (94, 123) spanning 51 by 19 pixels then Draws a black line from (113, 20) to (145, 88) then Places a cyan dot at position (493, 187).
; PLAN: r0=94(x), r1=123(y), r2=51(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x1), r6=20(y1), r7=145(x2), r8=88(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=493(x), r11=187(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 94
LDI r1, 123
LDI r2, 51
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 20
LDI r7, 145
LDI r8, 88
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 493
LDI r11, 187
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
