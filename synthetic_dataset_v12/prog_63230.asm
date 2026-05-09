; DESCRIPTION: Composite: Places a blue 87x52 rectangle at position (106, 95) then Draws a green line from (31, 65) to (266, 195) then Sets a single cyan pixel at (35, 6).
; PLAN: r0=106(x), r1=95(y), r2=87(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x1), r6=65(y1), r7=266(x2), r8=195(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=35(x), r11=6(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 106
LDI r1, 95
LDI r2, 87
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 65
LDI r7, 266
LDI r8, 195
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 6
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
