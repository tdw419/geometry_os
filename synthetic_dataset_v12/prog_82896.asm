; DESCRIPTION: Draws a blue line from (182, 211) to (309, 254).
; PLAN: r0=182(x1), r1=211(y1), r2=309(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 211
LDI r2, 309
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
