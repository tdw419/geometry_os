; DESCRIPTION: Draws a blue line from (130, 252) to (447, 164).
; PLAN: r0=130(x1), r1=252(y1), r2=447(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 252
LDI r2, 447
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
