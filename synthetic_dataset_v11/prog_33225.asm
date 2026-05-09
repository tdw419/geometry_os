; DESCRIPTION: Draws a white line from (170, 250) to (229, 51).
; PLAN: r0=170(x1), r1=250(y1), r2=229(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 250
LDI r2, 229
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
