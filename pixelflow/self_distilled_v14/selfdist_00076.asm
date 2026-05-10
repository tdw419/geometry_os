; DESCRIPTION: Draws a white line from (51, 44) to (216, 164).
; PLAN: r0=51(x1), r1=44(y1), r2=216(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 44
LDI r2, 216
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
