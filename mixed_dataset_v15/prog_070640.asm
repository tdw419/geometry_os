; DESCRIPTION: Draws a red line from (1, 204) to (187, 145).
; PLAN: r0=1(x1), r1=204(y1), r2=187(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 204
LDI r2, 187
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
