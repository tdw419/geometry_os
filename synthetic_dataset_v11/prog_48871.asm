; DESCRIPTION: Draws a yellow line from (171, 30) to (51, 40).
; PLAN: r0=171(x1), r1=30(y1), r2=51(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 30
LDI r2, 51
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
