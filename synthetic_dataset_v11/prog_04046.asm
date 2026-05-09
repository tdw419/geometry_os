; DESCRIPTION: Draws a black line from (10, 79) to (37, 46).
; PLAN: r0=10(x1), r1=79(y1), r2=37(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 79
LDI r2, 37
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
