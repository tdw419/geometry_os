; DESCRIPTION: Draws a blue line from (371, 236) to (309, 162).
; PLAN: r0=371(x1), r1=236(y1), r2=309(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 236
LDI r2, 309
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
