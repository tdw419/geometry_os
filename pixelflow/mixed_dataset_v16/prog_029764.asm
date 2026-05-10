; DESCRIPTION: Composite: Renders a purple box of size 85x86 starting at (342, 43) then Draws a yellow line from (259, 200) to (323, 62) then Sets a single cyan pixel at (229, 149).
; PLAN: r0=342(x), r1=43(y), r2=85(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x1), r6=200(y1), r7=323(x2), r8=62(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=229(x), r11=149(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 43
LDI r2, 85
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 200
LDI r7, 323
LDI r8, 62
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 149
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
