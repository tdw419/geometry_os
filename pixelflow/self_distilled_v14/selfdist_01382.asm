; DESCRIPTION: Draws a blue line from (296, 195) to (266, 186).
; PLAN: r0=296(x1), r1=195(y1), r2=266(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 195
LDI r2, 266
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
