; DESCRIPTION: Draws a magenta line from (87, 232) to (443, 155).
; PLAN: r0=87(x1), r1=232(y1), r2=443(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 232
LDI r2, 443
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
