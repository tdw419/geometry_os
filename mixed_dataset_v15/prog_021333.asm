; DESCRIPTION: Draws a white line from (278, 250) to (279, 106).
; PLAN: r0=278(x1), r1=250(y1), r2=279(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 250
LDI r2, 279
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
