; DESCRIPTION: Draws a black line from (251, 198) to (21, 46).
; PLAN: r0=251(x1), r1=198(y1), r2=21(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 198
LDI r2, 21
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
