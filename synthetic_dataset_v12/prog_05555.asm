; DESCRIPTION: Draws a white line from (4, 124) to (6, 85).
; PLAN: r0=4(x1), r1=124(y1), r2=6(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 124
LDI r2, 6
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
