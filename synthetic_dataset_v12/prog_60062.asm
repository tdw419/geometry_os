; DESCRIPTION: Draws a white line from (133, 3) to (315, 6).
; PLAN: r0=133(x1), r1=3(y1), r2=315(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 3
LDI r2, 315
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
