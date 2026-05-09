; DESCRIPTION: Composite: Draws a orange line from (335, 175) to (446, 190) then Renders a magenta disk with center (276, 149) and radius 79.
; PLAN: r0=335(x1), r1=175(y1), r2=446(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=149(y), r7=79(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 175
LDI r2, 446
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 149
LDI r7, 79
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
