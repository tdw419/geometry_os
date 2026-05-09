; DESCRIPTION: Draws a black line from (288, 60) to (55, 233).
; PLAN: r0=288(x1), r1=60(y1), r2=55(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 60
LDI r2, 55
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
