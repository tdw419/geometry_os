; DESCRIPTION: Draws a white line from (57, 51) to (72, 33).
; PLAN: r0=57(x1), r1=51(y1), r2=72(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 51
LDI r2, 72
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
