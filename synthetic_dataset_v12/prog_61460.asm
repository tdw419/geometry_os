; DESCRIPTION: Draws a white line from (313, 119) to (226, 206).
; PLAN: r0=313(x1), r1=119(y1), r2=226(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 119
LDI r2, 226
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
