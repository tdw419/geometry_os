; DESCRIPTION: Draws a green line from (221, 251) to (105, 141).
; PLAN: r0=221(x1), r1=251(y1), r2=105(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 251
LDI r2, 105
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
