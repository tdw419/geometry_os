; DESCRIPTION: Composite: Draws a yellow line from (110, 79) to (116, 229) then Renders a purple box of size 45x12 starting at (363, 121).
; PLAN: r0=110(x1), r1=79(y1), r2=116(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=121(y), r7=45(width), r8=12(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 79
LDI r2, 116
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 121
LDI r7, 45
LDI r8, 12
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
