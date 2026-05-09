; DESCRIPTION: Draws a white line from (395, 198) to (112, 193).
; PLAN: r0=395(x1), r1=198(y1), r2=112(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 198
LDI r2, 112
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
