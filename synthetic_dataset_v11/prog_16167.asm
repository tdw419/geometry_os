; DESCRIPTION: Draws a white line from (113, 72) to (15, 51).
; PLAN: r0=113(x1), r1=72(y1), r2=15(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 72
LDI r2, 15
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
