; DESCRIPTION: Composite: Renders a magenta box of size 65x75 starting at (119, 126) then Draws a red line from (265, 211) to (255, 52) then Sets a single blue pixel at (78, 111).
; PLAN: r0=119(x), r1=126(y), r2=65(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x1), r6=211(y1), r7=255(x2), r8=52(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=78(x), r11=111(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 119
LDI r1, 126
LDI r2, 65
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 211
LDI r7, 255
LDI r8, 52
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 111
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
