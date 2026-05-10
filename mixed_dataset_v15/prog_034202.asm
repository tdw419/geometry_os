; DESCRIPTION: Composite: Draws a yellow line from (105, 39) to (122, 232) then Sets a single black pixel at (363, 108).
; PLAN: r0=105(x1), r1=39(y1), r2=122(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=108(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 39
LDI r2, 122
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 108
LDI r7, 0x000000
PSET r5, r6, r7
HALT
