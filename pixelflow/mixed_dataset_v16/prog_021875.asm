; DESCRIPTION: Draws a green line from (98, 105) to (378, 234).
; PLAN: r0=98(x1), r1=105(y1), r2=378(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 105
LDI r2, 378
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
