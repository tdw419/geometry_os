; DESCRIPTION: Composite: Creates a blue rectangular region at (439, 8) spanning 51 by 12 pixels then Draws a orange line from (450, 208) to (270, 24) then Sets a single orange pixel at (232, 52).
; PLAN: r0=439(x), r1=8(y), r2=51(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x1), r6=208(y1), r7=270(x2), r8=24(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=52(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 439
LDI r1, 8
LDI r2, 51
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 208
LDI r7, 270
LDI r8, 24
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 52
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
