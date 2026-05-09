; DESCRIPTION: Draws a green line from (458, 251) to (279, 17).
; PLAN: r0=458(x1), r1=251(y1), r2=279(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 251
LDI r2, 279
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
