; DESCRIPTION: Draws a white line from (393, 2) to (358, 89).
; PLAN: r0=393(x1), r1=2(y1), r2=358(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 2
LDI r2, 358
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
