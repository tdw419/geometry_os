; DESCRIPTION: Draws a white line from (322, 187) to (500, 72).
; PLAN: r0=322(x1), r1=187(y1), r2=500(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 187
LDI r2, 500
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
