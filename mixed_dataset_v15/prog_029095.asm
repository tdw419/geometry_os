; DESCRIPTION: Composite: Draws a red line from (2, 163) to (416, 194) then Sets a single yellow pixel at (132, 244).
; PLAN: r0=2(x1), r1=163(y1), r2=416(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=244(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 2
LDI r1, 163
LDI r2, 416
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 244
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
