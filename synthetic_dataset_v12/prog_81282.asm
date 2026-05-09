; DESCRIPTION: Composite: Renders a blue box of size 79x13 starting at (198, 52) then Draws a red line from (55, 91) to (379, 24) then Sets a single green pixel at (102, 180).
; PLAN: r0=198(x), r1=52(y), r2=79(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x1), r6=91(y1), r7=379(x2), r8=24(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=102(x), r11=180(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 52
LDI r2, 79
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 91
LDI r7, 379
LDI r8, 24
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 180
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
