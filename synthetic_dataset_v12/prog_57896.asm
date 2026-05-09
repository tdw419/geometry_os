; DESCRIPTION: Composite: Draws a yellow line from (35, 21) to (169, 188) then Sets a single green pixel at (388, 20).
; PLAN: r0=35(x1), r1=21(y1), r2=169(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=20(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 35
LDI r1, 21
LDI r2, 169
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 20
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
