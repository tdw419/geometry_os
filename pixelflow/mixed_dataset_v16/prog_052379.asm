; DESCRIPTION: Draws a white line from (277, 76) to (501, 149).
; PLAN: r0=277(x1), r1=76(y1), r2=501(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 76
LDI r2, 501
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
