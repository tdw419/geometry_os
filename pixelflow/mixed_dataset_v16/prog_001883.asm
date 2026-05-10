; DESCRIPTION: Draws a magenta line from (478, 223) to (87, 149).
; PLAN: r0=478(x1), r1=223(y1), r2=87(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 223
LDI r2, 87
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
