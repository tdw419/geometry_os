; DESCRIPTION: Draws a blue line from (32, 156) to (366, 241).
; PLAN: r0=32(x1), r1=156(y1), r2=366(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 156
LDI r2, 366
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
