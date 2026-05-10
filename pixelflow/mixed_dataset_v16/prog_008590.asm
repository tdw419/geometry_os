; DESCRIPTION: Composite: Places a magenta circle of radius 27 at center (335, 66) then Draws a orange line from (374, 150) to (143, 205).
; PLAN: r0=335(x), r1=66(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x1), r6=150(y1), r7=143(x2), r8=205(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 66
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 150
LDI r7, 143
LDI r8, 205
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
