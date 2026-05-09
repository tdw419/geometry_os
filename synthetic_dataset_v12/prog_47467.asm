; DESCRIPTION: Composite: Creates a white rectangular region at (154, 118) spanning 43 by 86 pixels then Draws a yellow line from (295, 215) to (89, 237) then Sets a single yellow pixel at (386, 3).
; PLAN: r0=154(x), r1=118(y), r2=43(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x1), r6=215(y1), r7=89(x2), r8=237(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=3(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 154
LDI r1, 118
LDI r2, 43
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 215
LDI r7, 89
LDI r8, 237
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 3
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
