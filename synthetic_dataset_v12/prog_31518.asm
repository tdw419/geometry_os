; DESCRIPTION: Places a white line segment connecting (171, 89) to (121, 79).
; PLAN: r0=171(x1), r1=89(y1), r2=121(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 89
LDI r2, 121
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
