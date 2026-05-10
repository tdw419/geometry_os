; DESCRIPTION: Draws a white line from (279, 102) to (406, 145).
; PLAN: r0=279(x1), r1=102(y1), r2=406(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 102
LDI r2, 406
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
