; DESCRIPTION: Draws a blue line from (371, 252) to (393, 143).
; PLAN: r0=371(x1), r1=252(y1), r2=393(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 252
LDI r2, 393
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
