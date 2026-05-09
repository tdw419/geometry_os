; DESCRIPTION: Draws a blue line from (186, 71) to (159, 236).
; PLAN: r0=186(x1), r1=71(y1), r2=159(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 71
LDI r2, 159
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
