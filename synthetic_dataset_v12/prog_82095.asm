; DESCRIPTION: Draws a blue line from (439, 145) to (77, 102).
; PLAN: r0=439(x1), r1=145(y1), r2=77(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 145
LDI r2, 77
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
