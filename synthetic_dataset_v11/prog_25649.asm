; DESCRIPTION: Draws a black line from (169, 70) to (183, 46).
; PLAN: r0=169(x1), r1=70(y1), r2=183(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 70
LDI r2, 183
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
