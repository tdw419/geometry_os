; DESCRIPTION: Draws a white line from (264, 85) to (145, 250).
; PLAN: r0=264(x1), r1=85(y1), r2=145(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 85
LDI r2, 145
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
