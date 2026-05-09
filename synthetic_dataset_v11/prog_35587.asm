; DESCRIPTION: Draws a white line from (6, 89) to (6, 83).
; PLAN: r0=6(x1), r1=89(y1), r2=6(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 89
LDI r2, 6
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
