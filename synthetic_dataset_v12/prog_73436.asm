; DESCRIPTION: Composite: Draws a cyan line from (448, 190) to (43, 184) then Renders a blue box of size 11x84 starting at (432, 92).
; PLAN: r0=448(x1), r1=190(y1), r2=43(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=92(y), r7=11(width), r8=84(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 190
LDI r2, 43
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 92
LDI r7, 11
LDI r8, 84
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
