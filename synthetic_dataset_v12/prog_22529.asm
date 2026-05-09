; DESCRIPTION: Draws a blue line from (331, 168) to (437, 127).
; PLAN: r0=331(x1), r1=168(y1), r2=437(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 168
LDI r2, 437
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
