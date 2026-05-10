; DESCRIPTION: Draws a green line from (312, 53) to (79, 33).
; PLAN: r0=312(x1), r1=53(y1), r2=79(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 53
LDI r2, 79
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
