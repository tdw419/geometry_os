; DESCRIPTION: Draws a white line from (145, 110) to (247, 86).
; PLAN: r0=145(x1), r1=110(y1), r2=247(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 110
LDI r2, 247
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
