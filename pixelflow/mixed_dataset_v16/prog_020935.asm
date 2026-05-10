; DESCRIPTION: Composite: Draws a blue line from (273, 114) to (102, 198) then Sets a single red pixel at (32, 35).
; PLAN: r0=273(x1), r1=114(y1), r2=102(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=35(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 114
LDI r2, 102
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 35
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
