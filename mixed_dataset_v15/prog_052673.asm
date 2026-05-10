; DESCRIPTION: Draws a white line from (51, 87) to (155, 103).
; PLAN: r0=51(x1), r1=87(y1), r2=155(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 87
LDI r2, 155
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
