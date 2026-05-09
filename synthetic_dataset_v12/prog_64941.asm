; DESCRIPTION: Composite: Draws a yellow line from (487, 198) to (19, 144) then Sets a single black pixel at (377, 250).
; PLAN: r0=487(x1), r1=198(y1), r2=19(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=250(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 487
LDI r1, 198
LDI r2, 19
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 250
LDI r7, 0x000000
PSET r5, r6, r7
HALT
