; DESCRIPTION: Draws a blue line from (309, 126) to (432, 99).
; PLAN: r0=309(x1), r1=126(y1), r2=432(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 126
LDI r2, 432
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
