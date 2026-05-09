; DESCRIPTION: Draws a green line from (51, 79) to (123, 77).
; PLAN: r0=51(x1), r1=79(y1), r2=123(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 79
LDI r2, 123
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
