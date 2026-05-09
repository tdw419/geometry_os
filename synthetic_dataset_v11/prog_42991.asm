; DESCRIPTION: Draws a black line from (219, 241) to (188, 237).
; PLAN: r0=219(x1), r1=241(y1), r2=188(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 241
LDI r2, 188
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
