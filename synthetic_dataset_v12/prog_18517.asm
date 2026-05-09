; DESCRIPTION: Draws a white line from (389, 44) to (176, 18).
; PLAN: r0=389(x1), r1=44(y1), r2=176(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 44
LDI r2, 176
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
