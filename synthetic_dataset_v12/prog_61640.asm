; DESCRIPTION: Draws a black line from (500, 244) to (288, 96).
; PLAN: r0=500(x1), r1=244(y1), r2=288(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 244
LDI r2, 288
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
