; DESCRIPTION: Draws a black line from (223, 108) to (174, 1).
; PLAN: r0=223(x1), r1=108(y1), r2=174(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 108
LDI r2, 174
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
