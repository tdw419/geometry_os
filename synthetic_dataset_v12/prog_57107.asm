; DESCRIPTION: Draws a white line from (484, 191) to (175, 169).
; PLAN: r0=484(x1), r1=191(y1), r2=175(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 191
LDI r2, 175
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
