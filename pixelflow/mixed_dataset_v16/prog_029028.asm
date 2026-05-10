; DESCRIPTION: Draws a blue line from (323, 204) to (467, 55).
; PLAN: r0=323(x1), r1=204(y1), r2=467(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 204
LDI r2, 467
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
