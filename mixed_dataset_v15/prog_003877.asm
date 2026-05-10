; DESCRIPTION: Draws a blue line from (309, 226) to (187, 106).
; PLAN: r0=309(x1), r1=226(y1), r2=187(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 226
LDI r2, 187
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
