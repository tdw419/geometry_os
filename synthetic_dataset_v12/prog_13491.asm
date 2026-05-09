; DESCRIPTION: Draws a blue line from (351, 159) to (403, 231).
; PLAN: r0=351(x1), r1=159(y1), r2=403(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 159
LDI r2, 403
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
