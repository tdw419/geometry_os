; DESCRIPTION: Draws a black line from (149, 48) to (51, 162).
; PLAN: r0=149(x1), r1=48(y1), r2=51(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 48
LDI r2, 51
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
