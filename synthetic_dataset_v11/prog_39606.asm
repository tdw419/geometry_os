; DESCRIPTION: Draws a black line from (51, 112) to (70, 200).
; PLAN: r0=51(x1), r1=112(y1), r2=70(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 112
LDI r2, 70
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
