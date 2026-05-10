; DESCRIPTION: Composite: Draws a blue line from (80, 157) to (353, 175) then Sets a single green pixel at (158, 241).
; PLAN: r0=80(x1), r1=157(y1), r2=353(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=241(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 80
LDI r1, 157
LDI r2, 353
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 241
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
