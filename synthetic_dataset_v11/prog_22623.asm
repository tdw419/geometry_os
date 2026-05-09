; DESCRIPTION: Places a red line segment connecting (171, 28) to (51, 96).
; PLAN: r0=171(x1), r1=28(y1), r2=51(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 28
LDI r2, 51
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
