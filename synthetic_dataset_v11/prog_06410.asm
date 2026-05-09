; DESCRIPTION: Draws a white line from (11, 238) to (79, 178).
; PLAN: r0=11(x1), r1=238(y1), r2=79(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 238
LDI r2, 79
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
