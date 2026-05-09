; DESCRIPTION: Draws a orange line from (51, 200) to (466, 91).
; PLAN: r0=51(x1), r1=200(y1), r2=466(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 200
LDI r2, 466
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
