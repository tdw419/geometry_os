; DESCRIPTION: Draws a cyan line from (251, 148) to (133, 94).
; PLAN: r0=251(x1), r1=148(y1), r2=133(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 148
LDI r2, 133
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
