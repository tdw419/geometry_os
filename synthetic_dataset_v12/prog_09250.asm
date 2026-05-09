; DESCRIPTION: Draws a white line from (3, 233) to (229, 51).
; PLAN: r0=3(x1), r1=233(y1), r2=229(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 233
LDI r2, 229
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
