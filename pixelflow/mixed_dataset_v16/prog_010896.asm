; DESCRIPTION: Composite: Renders a purple line between points (396, 91) and (189, 98) then Draws a magenta rectangle at (119, 4) with width 97 and height 38 then Sets a single cyan pixel at (406, 77).
; PLAN: r0=396(x1), r1=91(y1), r2=189(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=4(y), r7=97(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=406(x), r11=77(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 396
LDI r1, 91
LDI r2, 189
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 4
LDI r7, 97
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 77
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
