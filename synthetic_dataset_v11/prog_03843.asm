; DESCRIPTION: Draws a white line from (63, 250) to (121, 140).
; PLAN: r0=63(x1), r1=250(y1), r2=121(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 250
LDI r2, 121
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
