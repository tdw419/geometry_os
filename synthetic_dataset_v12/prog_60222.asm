; DESCRIPTION: Draws a green line from (366, 38) to (491, 219).
; PLAN: r0=366(x1), r1=38(y1), r2=491(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 38
LDI r2, 491
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
