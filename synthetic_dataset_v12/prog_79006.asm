; DESCRIPTION: Draws a black line from (370, 210) to (385, 227).
; PLAN: r0=370(x1), r1=210(y1), r2=385(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 210
LDI r2, 385
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
