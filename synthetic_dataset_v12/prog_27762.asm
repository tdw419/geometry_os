; DESCRIPTION: Draws a purple line from (299, 206) to (433, 25).
; PLAN: r0=299(x1), r1=206(y1), r2=433(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 206
LDI r2, 433
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
