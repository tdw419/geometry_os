; DESCRIPTION: Draws a purple line from (218, 227) to (171, 6).
; PLAN: r0=218(x1), r1=227(y1), r2=171(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 227
LDI r2, 171
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
