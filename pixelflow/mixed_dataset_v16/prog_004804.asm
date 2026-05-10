; DESCRIPTION: Composite: Places a magenta 112x31 rectangle at position (381, 194) then Draws a red line from (295, 186) to (245, 115) then Sets a single cyan pixel at (263, 118).
; PLAN: r0=381(x), r1=194(y), r2=112(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x1), r6=186(y1), r7=245(x2), r8=115(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=263(x), r11=118(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 381
LDI r1, 194
LDI r2, 112
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 186
LDI r7, 245
LDI r8, 115
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 118
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
