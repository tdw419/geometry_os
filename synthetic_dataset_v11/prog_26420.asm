; DESCRIPTION: Draws a blue line from (248, 195) to (241, 149).
; PLAN: r0=248(x1), r1=195(y1), r2=241(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 195
LDI r2, 241
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
