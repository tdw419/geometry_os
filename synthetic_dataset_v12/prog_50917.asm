; DESCRIPTION: Draws a white line from (238, 193) to (45, 77).
; PLAN: r0=238(x1), r1=193(y1), r2=45(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 193
LDI r2, 45
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
