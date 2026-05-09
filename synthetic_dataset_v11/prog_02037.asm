; DESCRIPTION: Draws a yellow line from (210, 171) to (51, 251).
; PLAN: r0=210(x1), r1=171(y1), r2=51(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 171
LDI r2, 51
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
